#! /bin/bash
#
quicktype -s schema -t Module --final-props --coders-in-class -o lib/model/ir_model.dart lib/model/schema/ir_schema.yaml
