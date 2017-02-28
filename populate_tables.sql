

INSERT  INTO "ITEM"."IC_CATEGORY" VALUES ("ITEM"."IC_CATEGORY_SEQ".nextval, 'Food', 'The food category');
INSERT  INTO "ITEM"."IC_CATEGORY" VALUES ("ITEM"."IC_CATEGORY_SEQ".nextval, 'Cars', 'The cars category');
INSERT  INTO "ITEM"."IC_CATEGORY" VALUES ("ITEM"."IC_CATEGORY_SEQ".nextval, 'Perfumes', 'The perfumes category');
INSERT  INTO "ITEM"."IC_CATEGORY" VALUES ("ITEM"."IC_CATEGORY_SEQ".nextval, 'Toys', 'The toys category');
INSERT  INTO "ITEM"."IC_CATEGORY" VALUES ("ITEM"."IC_CATEGORY_SEQ".nextval, 'Electronics','The electronics category');

INSERT  INTO "ITEM"."IC_BRAND" VALUES ("ITEM"."BRAND_ID_SEQ".nextval, 'Cola Cao', 'The Allianz brand');
INSERT  INTO "ITEM"."IC_BRAND" VALUES ("ITEM"."BRAND_ID_SEQ".nextval, 'Kinder', 'The Kinder brand');
INSERT  INTO "ITEM"."IC_BRAND" VALUES ("ITEM"."BRAND_ID_SEQ".nextval, 'Audi', 'The Audi brand');
INSERT  INTO "ITEM"."IC_BRAND" VALUES ("ITEM"."BRAND_ID_SEQ".nextval, 'BMW', 'The BMW brand');
INSERT  INTO "ITEM"."IC_BRAND" VALUES ("ITEM"."BRAND_ID_SEQ".nextval, 'Burberry','The Burberry brand');
INSERT  INTO "ITEM"."IC_BRAND" VALUES ("ITEM"."BRAND_ID_SEQ".nextval, 'Givenchy', 'The Givenchy brand');
INSERT  INTO "ITEM"."IC_BRAND" VALUES ("ITEM"."BRAND_ID_SEQ".nextval, 'Nintendo toys‎ ', 'The Nintendo toys‎  brand');
INSERT  INTO "ITEM"."IC_BRAND" VALUES ("ITEM"."BRAND_ID_SEQ".nextval, 'Big Loo', 'The Big Loo brand');
INSERT  INTO "ITEM"."IC_BRAND" VALUES ("ITEM"."BRAND_ID_SEQ".nextval, 'Fujitsu', 'The Fujitsu brand');
INSERT  INTO "ITEM"."IC_BRAND" VALUES ("ITEM"."BRAND_ID_SEQ".nextval, 'Pioneer','The Pioneer brand');


DECLARE
  v_count NUMBER DEFAULT 0;
BEGIN
  FOR k IN 1..200
  LOOP
    FOR i IN
    (
      SELECT
        CATEGORY_ID,
        CATEGORY_NAME
      FROM
        "ITEM".IC_CATEGORY
    )
    LOOP
      /*DBMS_OUTPUT.PUT_LINE('HELLO '||i.CATEGORY_ID||' '||i.CATEGORY_NAME);*/
      FOR j IN
      (
        SELECT DISTINCT
          BRAND_ID,
          BRAND_NAME
        FROM
          "ITEM".IC_BRAND
      )
      LOOP
        /*DBMS_OUTPUT.PUT_LINE(j.BRAND_ID||' '||j.BRAND_NAME);*/
        
        INSERT  INTO "ITEM"."IC_ITEM" VALUES ("ITEM"."ITEM_ID_SEQ".nextval, 'ITEM_NAME_'||v_count ,'The ' || 'ITEM_NAME_'||v_count || ' description',j.BRAND_ID,i.CATEGORY_ID);
        
        
        v_COUNT := v_COUNT + 1;
      END LOOP;
    END LOOP;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(v_COUNT);
END;


DECLARE
  v_count NUMBER DEFAULT 0;
BEGIN
    FOR j IN
    (
      SELECT
        ITEM_ID
      FROM
        "ITEM".IC_ITEM
    )
    LOOP
      DBMS_OUTPUT.PUT_LINE(j.ITEM_ID);
      FOR k IN 1..10 LOOP
        INSERT  INTO "PRICING"."PR_PRICE" VALUES (j.ITEM_ID,SYSDATE - k,MOD(j.ITEM_ID,2));
        v_COUNT := v_COUNT + 1;
      END LOOP;
      
    END LOOP;
  DBMS_OUTPUT.PUT_LINE(v_COUNT);
END;

DECLARE
  v_count NUMBER DEFAULT 0;
  idd NUMBER DEFAULT 0;
BEGIN
    FOR j IN
    (
      SELECT
        ITEM_ID
      FROM
        "ITEM".IC_ITEM
    )
    LOOP
       idd := idd + 10;
      FOR k IN 1..10 LOOP
        /*DBMS_OUTPUT.PUT_LINE(idd+k);*/
        INSERT  INTO "PRICING"."PR_PRICE" VALUES (idd+k,SYSDATE - k,MOD(j.ITEM_ID,25));
        v_COUNT := v_COUNT + 1;
      END LOOP;
      
    END LOOP;
  /*DBMS_OUTPUT.PUT_LINE(v_COUNT);*/
END;


COMMIT;
