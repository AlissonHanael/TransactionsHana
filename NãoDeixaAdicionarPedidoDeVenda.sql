/*Trava para Pedido de Venda, xPed e ItemPad obrigatorio, quando a caracteristica1 do PN for verdadeiro*/
IF (:object_type = '17' and :transaction_type in ('A','U')) THEN
	IF((SELECT "QryGroup1" FROM OCRD WHERE "CardCode" = (SELECT "CardCode" FROM ORDR WHERE "DocEntry" = :list_of_cols_val_tab_del)) = 'Y') THEN
		IF((SELECT COUNT("U_B2F_xPed") FROM RDR1 WHERE "DocEntry" = :list_of_cols_val_tab_del) < (SELECT COUNT(*) FROM RDR1 WHERE "DocEntry" = :list_of_cols_val_tab_del)) THEN 
			error:=170001;
			error_message:='B2F: Xped é obrigatório.';
		END IF;
		IF((SELECT COUNT("U_B2F_ItemPed") FROM RDR1 WHERE "DocEntry" = :list_of_cols_val_tab_del) < (SELECT COUNT(*) FROM RDR1 WHERE "DocEntry" = :list_of_cols_val_tab_del)) THEN 
			error:=170002;
			error_message:='B2F: ItemPed é obrigatório.';
		END IF;
	END IF;
END IF;