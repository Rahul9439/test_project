package com.example.test_project

import android.Manifest
import android.bluetooth.BluetoothAdapter
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val CHANNEL = "bluetooth_channel"
    private var enableBluetoothResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        // Set up a MethodChannel
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "enableBluetooth" -> {
                    enableBluetoothResult = result
                    enableBluetooth()
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun enableBluetooth() {
        val bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()

        if (bluetoothAdapter == null) {
            // Device does not support Bluetooth
            enableBluetoothResult?.error("BLUETOOTH_NOT_SUPPORTED", "Bluetooth is not supported on this device", null)
            return
        }

        if (bluetoothAdapter.isEnabled) {
            // Bluetooth is already enabled
            enableBluetoothResult?.success("Bluetooth is already enabled")
            return
        }

        // Check and request Bluetooth permission if needed
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            val bluetoothConnectPermission = Manifest.permission.BLUETOOTH_CONNECT

            if (ContextCompat.checkSelfPermission(this, bluetoothConnectPermission) != PackageManager.PERMISSION_GRANTED) {
                ActivityCompat.requestPermissions(this, arrayOf(bluetoothConnectPermission), 3)
                return
            }
        }

        // Request user to enable Bluetooth
        val enableBluetoothIntent = Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)
        startActivityForResult(enableBluetoothIntent, 2)
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        if (requestCode == 1) {
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                // Permission granted, attempt to enable Bluetooth again
                enableBluetooth()
            } else {
                enableBluetoothResult?.error("BLUETOOTH_PERMISSION_DENIED", "Bluetooth permission denied", null)
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == 2) {
            enableBluetoothResult?.success("Bluetooth enabled")
        }
    }
}


