#!/bin/bash

confirm() {
	echo "Enter to continue, N to skip"
	read CONFIRMATION
	if [ "$CONFIRMATION" = "N" ]; then
		return 1
	fi
	if [ "$CONFIRMATION" = "n" ]; then
		return 1
	fi
	return 0
}
