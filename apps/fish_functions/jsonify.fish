function jsonify --wraps='python3' --description "Pretty prints json using python3's json.tool and bat"
    python3 -m json.tool $argv | bat -l json
end
