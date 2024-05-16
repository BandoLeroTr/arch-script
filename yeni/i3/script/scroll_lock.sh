#!/bin/bash

# Fonksiyon tanımı
toggle_scroll_lock() {
    # scroll lock LED'ini aç/kapat
    xset led named "Scroll Lock"
}

# Fonksiyonu çağır
toggle_scroll_lock

