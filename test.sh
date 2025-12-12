#!/bin/bash

# Check the argument
if [ "$1" == "new" ]; then
    echo "Running new tests..."
    pytest tests/lib/test_azure.py::test_azure_images_edit_sends_json_sync tests/lib/test_azure.py::test_azure_images_edit_with_filename_detects_mime tests/lib/test_azure.py::test_azure_images_generate_sends_json_sync tests/lib/test_azure.py::test_azure_images_edit_sends_json_async tests/lib/test_azure.py::test_azure_images_generate_sends_json_async -v
elif [ "$1" == "base" ]; then
    echo "Running base tests (excluding new ones)..."
    pytest tests/lib/test_azure.py -k "not (test_azure_images_edit_sends_json_sync or test_azure_images_edit_with_filename_detects_mime or test_azure_images_generate_sends_json_sync or test_azure_images_edit_sends_json_async or test_azure_images_generate_sends_json_async)" -v
else
    echo "Usage: $0 {new|base}"
    exit 1
fi