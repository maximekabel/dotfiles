#!/bin/bash

TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJlYTY0Y2I3ZmJkN2E0Y2I1YThkOGM4M2E5ZDgwMDVlMSIsImlhdCI6MTcxMTIxNDE3NywiZXhwIjoyMDI2NTc0MTc3fQ.jCrUPncS-YuiIcZ6sUONoMI8VdkZHQJwIVMSVIcWDT0

curl -X POST \
  https://home.mkabel.nl/api/services/scene/turn_on \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"entity_id": "scene.relax"}'
