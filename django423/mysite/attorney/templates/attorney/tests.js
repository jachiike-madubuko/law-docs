QUnit.test("btnWitS_clicked", function (assert) {
    var fixture = $("#qunit-fixture");
    assert.expect(2);

    var html = `
    <ul id='base'>
        <li>
            <div id='prnt'>
                <div>
                    <div class='A'>
                    </div>
                </div>
            </div>
        </li>
    </ul>
    <div class='legaLogi'/>
    <div id='sortable'/>
    <div id='addbox'/>
    `;

    var opt = {};

    fixture.append(html);
    $("#addbox").dialog(opt);
    $("#prnt").on("click", function () {
        assert.ok(true, "Button was clicked");
        btnWitS();
        assert.deepEqual($("#base li").length, 2, "List item added successfully");
    });

    $("#prnt").trigger("click");
});

QUnit.test("secH_clicked", function (assert) {
    var fixture = $("#qunit-fixture");
    assert.expect(2);

    var html = `
    <ul id='base'>
        <li>
            <div id='prnt'>
                <div>
                    <div class='A'>
                    </div>
                </div>
            </div>
        </li>
    </ul>
    <div class='legaLogi'/>
    <div id='sortable'/>
    <div id='addbox'/>
    `;

    var opt = {};

    fixture.append(html);
    $("#addbox").dialog(opt);
    $("#prnt").on("click", function () {
        assert.ok(true, "Button was clicked");
        secH();
        assert.deepEqual($("#base li").length, 2, "List item added successfully");
    });

    $("#prnt").trigger("click");
});

QUnit.test("WillP_clicked", function (assert) {
    var fixture = $("#qunit-fixture");
    assert.expect(2);

    var html = `
    <ul id='base'>
        <li>
            <div id='prnt'>
                <div>
                    <div class='A'>
                    </div>
                </div>
            </div>
        </li>
    </ul>
    <div class='legaLogi'/>
    <div id='sortable'/>
    <div id='addbox'/>
    `;

    var opt = {};

    fixture.append(html);
    $("#addbox").dialog(opt);
    $("#prnt").on("click", function () {
        assert.ok(true, "Button was clicked");
        WillP();
        assert.deepEqual($("#base li").length, 2, "List item added successfully");
    });

    $("#prnt").trigger("click");
});

QUnit.test("SpouseP_clicked", function (assert) {
    var fixture = $("#qunit-fixture");
    assert.expect(2);

    var html = `
    <ul id='base'>
        <li>
            <div id='prnt'>
                <div>
                    <div class='A'>
                    </div>
                </div>
            </div>
        </li>
    </ul>
    <div class='legaLogi'/>
    <div id='sortable'/>
    <div id='addbox'/>
    `;

    var opt = {};

    fixture.append(html);
    $("#addbox").dialog(opt);
    $("#prnt").on("click", function () {
        assert.ok(true, "Button was clicked");
        SpouseP();
        assert.deepEqual($("#base li").length, 2, "List item added successfully");
    });

    $("#prnt").trigger("click");
});

QUnit.test("ChildrenP_clicked", function (assert) {
    var fixture = $("#qunit-fixture");
    assert.expect(2);

    var html = `
    <ul id='base'>
        <li>
            <div id='prnt'>
                <div>
                    <div class='A'>
                    </div>
                </div>
            </div>
        </li>
    </ul>
    <div class='legaLogi'/>
    <div id='sortable'/>
    <div id='addbox'/>
    `;

    var opt = {};

    fixture.append(html);
    $("#addbox").dialog(opt);
    $("#prnt").on("click", function () {
        assert.ok(true, "Button was clicked");
        ChildrenP();
        assert.deepEqual($("#base li").length, 2, "List item added successfully");
    });

    $("#prnt").trigger("click");
});

QUnit.test("PetL_clicked", function (assert) {
    var fixture = $("#qunit-fixture");
    assert.expect(2);

    var html = `
    <ul id='base'>
        <li>
            <div id='prnt'>
                <div>
                    <div class='A'>
                    </div>
                </div>
            </div>
        </li>
    </ul>
    <div class='legaLogi'/>
    <div id='sortable'/>
    <div id='addbox'/>
    `;

    var opt = {};

    fixture.append(html);
    $("#addbox").dialog(opt);
    $("#prnt").on("click", function () {
        assert.ok(true, "Button was clicked");
        PetL();
        assert.deepEqual($("#base li").length, 2, "List item added successfully");
    });

    $("#prnt").trigger("click");
});

QUnit.test("PetCareL_clicked", function (assert) {
    var fixture = $("#qunit-fixture");
    assert.expect(2);

    var html = `
    <ul id='base'>
        <li>
            <div id='prnt'>
                <div>
                    <div class='A'>
                    </div>
                </div>
            </div>
        </li>
    </ul>
    <div class='legaLogi'/>
    <div id='sortable'/>
    <div id='addbox'/>
    `;

    var opt = {};

    fixture.append(html);
    $("#addbox").dialog(opt);
    $("#prnt").on("click", function () {
        assert.ok(true, "Button was clicked");
        PetCareL();
        assert.deepEqual($("#base li").length, 2, "List item added successfully");
    });

    $("#prnt").trigger("click");
});

QUnit.test("CareP_clicked", function (assert) {
    var fixture = $("#qunit-fixture");
    assert.expect(2);

    var html = `
    <ul id='base'>
        <li>
            <div id='prnt'>
                <div>
                    <div class='A'>
                    </div>
                </div>
            </div>
        </li>
    </ul>
    <div class='legaLogi'/>
    <div id='sortable'/>
    <div id='addbox'/>
    `;

    var opt = {};

    fixture.append(html);
    $("#addbox").dialog(opt);
    $("#prnt").on("click", function () {
        assert.ok(true, "Button was clicked");
        CareP();
        assert.deepEqual($("#base li").length, 2, "List item added successfully");
    });

    $("#prnt").trigger("click");
});

