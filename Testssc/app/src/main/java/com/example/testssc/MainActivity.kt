package com.example.testssc

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    data  class DtoNetworkDevice(val name: String) {

        companion object {
            fun toDto(device: DatabaseLaMetricDevice): DtoNetworkDevice {
                return  DtoNetworkDevice(device.name)
            }
        }
    }

    data  class DatabaseLaMetricDevice(val name: String) {

    }

    private fun handleNewDevices(devices: List<DatabaseLaMetricDevice>) {
        val newDevicesList =  devices.map { DtoNetworkDevice.toDto(it) }
        list2
    }
}
