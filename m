Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFC1366048;
	Tue,  9 Jun 2026 15:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018679; cv=none; b=GnUfJykDV+FHg9hdLLYKe+adwBLSSt7uE/snwXg+3xk2mq/v8oiZzbValy2M4RcZVn/qbr9gkZdVJ5almXBOzoY8OrKrd6Vxe2mVPuNZfMVNm1nDZ1iQ9zS9UECTCQta0cVriNkhCd0XD5/rXDhGnbHqPoLo2sU079dSiY9s4bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018679; c=relaxed/simple;
	bh=donY2YfWGanpkuo6Wd8/yvOUCPldJele8x1B6vXSYxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tO+FedEuA18bTJj6xcF8E9+XlUBLsacj43aUTxndmg5jf0cDMkY2/z1tsnOP8++dYe9Ikwv58CXbKfqhmjl/AYP5dwiaM1gVHB5yyCK08JJ1eQmsraHxy/DciiNLkRKl3+ue72DViUe2raiSB/YxuXjcOL6toBC9wUQJQn9rJiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=figMwX0u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="figMwX0u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6269D1F00893;
	Tue,  9 Jun 2026 15:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781018677;
	bh=pA089Pue/CPX74Lv/jKBbysGDcfqByapVhz4htVHxho=;
	h=Date:From:To:Cc:Subject;
	b=figMwX0uKw3Zb9+xi6XVpmRXqAULOTq14SF9r814U/GghuP9T3QlH973wkY4lPSmL
	 MENrUINvlcthwwQdTyRIh4yuB8MxZYZLV4drfadpyLsS49kQ0N6ywRLai4Z9gpBo/U
	 91UKrFG4Fr7r9Pxf2pLfGMc3948WLk5+pek50ia0DFe2/q6ruRI8JSurztNUwWpbaN
	 z8D/FB+7f2zsA0nTH0aRGoIthmn0JRbjVk3DO8AVOkJkPfC+7VRrkPzHHbVXpFGBZb
	 SFt73by5KK+0k6dKdRwFPgTDLHgofxy4M5I7U7FczHdmSQ14YYfZ52XAeM4SMIbqmZ
	 XyfM30Hlbmtcg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0D85B1AC56AE; Tue, 09 Jun 2026 16:24:35 +0100 (BST)
Date: Tue, 9 Jun 2026 16:24:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Johan Hovold <johan@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: linux-next: manual merge of the kthread tree with the i2c-host-fixes
 tree
Message-ID: <aigwM8t2LnDJvgdy@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VhpWT4J/pQpuR5IO"
Content-Disposition: inline


--VhpWT4J/pQpuR5IO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kthread tree got a conflict in:

  drivers/i2c/i2c-core-base.c

between commit:

  84762906e2666d ("i2c: core: fix adapter debugfs creation")

=66rom the i2c-host-fixes tree and commits:

  07d5fb537928aa ("i2c: core: fix adapter debugfs creation")
  a378a2bc73e3b7 ("i2c: core: clean up bus id allocation")

=66rom the kthread tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/i2c/i2c-core-base.c
index 764e293236b572,31e956bb3b7222..00000000000000
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@@ -1516,23 -1516,48 +1516,48 @@@ int i2c_handle_smbus_host_notify(struc
  }
  EXPORT_SYMBOL_GPL(i2c_handle_smbus_host_notify);
 =20
+ static int i2c_allocate_adapter_id(struct i2c_adapter *adap)
+ {
+ 	int id, start, end;
+=20
+ 	if (adap->nr =3D=3D -1) {
+ 		start =3D __i2c_first_dynamic_bus_num;
+ 		end =3D 0;
+ 	} else {
+ 		start =3D adap->nr;
+ 		end =3D adap->nr + 1;
+ 	}
+=20
+ 	mutex_lock(&core_lock);
+ 	id =3D idr_alloc(&i2c_adapter_idr, NULL, start, end, GFP_KERNEL);
+ 	mutex_unlock(&core_lock);
+ 	if (id < 0) {
+ 		if (adap->nr !=3D -1 && id =3D=3D -ENOSPC)
+ 			id =3D -EBUSY;
+ 		pr_err("adapter '%s': failed to allocate id: %d\n", adap->name, id);
+ 		return id;
+ 	}
+=20
+ 	adap->nr =3D id;
+=20
+ 	return 0;
+ }
+=20
  static int i2c_register_adapter(struct i2c_adapter *adap)
  {
- 	int res =3D -EINVAL;
+ 	int res;
 =20
  	/* Can't register until after driver model init */
- 	if (WARN_ON(!is_registered)) {
- 		res =3D -EAGAIN;
- 		goto out_list;
- 	}
+ 	if (WARN_ON(!is_registered))
+ 		return -EAGAIN;
 =20
  	/* Sanity checks */
  	if (WARN(!adap->name[0], "i2c adapter has no name"))
- 		goto out_list;
+ 		return -EINVAL;
 =20
  	if (!adap->algo) {
  		pr_err("adapter '%s': no algo supplied!\n", adap->name);
- 		goto out_list;
+ 		return -EINVAL;
  	}
 =20
  	if (!adap->lock_ops)
@@@ -1553,12 -1578,16 +1578,16 @@@
  	if (res) {
  		pr_err("adapter '%s': can't create Host Notify IRQs (%d)\n",
  		       adap->name, res);
- 		goto out_list;
+ 		return res;
  	}
 =20
+ 	res =3D i2c_allocate_adapter_id(adap);
+ 	if (res)
+ 		goto err_remove_irq_domain;
+=20
  	res =3D dev_set_name(&adap->dev, "i2c-%d", adap->nr);
  	if (res)
- 		goto err_remove_irq_domain;
+ 		goto err_free_id;
 =20
  	adap->dev.bus =3D &i2c_bus_type;
  	adap->dev.type =3D &i2c_adapter_type;
@@@ -1591,7 -1620,7 +1620,11 @@@
 =20
  	res =3D i2c_setup_smbus_alert(adap);
  	if (res)
++<<<<<<< HEAD
 +		goto out_reg;
++=3D=3D=3D=3D=3D=3D=3D
+ 		goto err_deregister_clients;
++>>>>>>> i2c/i2c/for-next
 =20
  	dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
 =20
@@@ -1610,7 -1639,7 +1643,11 @@@
 =20
  	return 0;
 =20
++<<<<<<< HEAD
 +out_reg:
++=3D=3D=3D=3D=3D=3D=3D
+ err_deregister_clients:
++>>>>>>> i2c/i2c/for-next
  	i2c_deregister_clients(adap);
  	device_del(&adap->dev);
  err_replace_id:
@@@ -1623,36 -1652,17 +1660,46 @@@ err_put_adap
  	init_completion(&adap->dev_released);
  	put_device(&adap->dev);
  	wait_for_completion(&adap->dev_released);
++<<<<<<< HEAD
 +err_remove_irq_domain:
 +	i2c_host_notify_irq_teardown(adap);
 +out_list:
++=3D=3D=3D=3D=3D=3D=3D
+ err_free_id:
++>>>>>>> i2c/i2c/for-next
  	mutex_lock(&core_lock);
  	idr_remove(&i2c_adapter_idr, adap->nr);
  	mutex_unlock(&core_lock);
+ err_remove_irq_domain:
+ 	i2c_host_notify_irq_teardown(adap);
+=20
  	return res;
  }
 =20
  /**
++<<<<<<< HEAD
 + * __i2c_add_numbered_adapter - i2c_add_numbered_adapter where nr is neve=
r -1
 + * @adap: the adapter to register (with adap->nr initialized)
 + * Context: can sleep
 + *
 + * See i2c_add_numbered_adapter() for details.
 + */
 +static int __i2c_add_numbered_adapter(struct i2c_adapter *adap)
 +{
 +	int id;
 +
 +	mutex_lock(&core_lock);
 +	id =3D idr_alloc(&i2c_adapter_idr, NULL, adap->nr, adap->nr + 1, GFP_KER=
NEL);
 +	mutex_unlock(&core_lock);
 +	if (WARN(id < 0, "couldn't get idr"))
 +		return id =3D=3D -ENOSPC ? -EBUSY : id;
 +
 +	return i2c_register_adapter(adap);
 +}
 +
 +/**
++=3D=3D=3D=3D=3D=3D=3D
++>>>>>>> i2c/i2c/for-next
   * i2c_add_adapter - declare i2c adapter, use dynamic bus number
   * @adapter: the adapter to add
   * Context: can sleep
@@@ -1672,17 -1682,8 +1719,22 @@@ int i2c_add_adapter(struct i2c_adapter=20
  	int id;
 =20
  	id =3D of_alias_get_id(dev->of_node, "i2c");
++<<<<<<< HEAD
 +	if (id >=3D 0) {
 +		adapter->nr =3D id;
 +		return __i2c_add_numbered_adapter(adapter);
 +	}
 +
 +	mutex_lock(&core_lock);
 +	id =3D idr_alloc(&i2c_adapter_idr, NULL,
 +		       __i2c_first_dynamic_bus_num, 0, GFP_KERNEL);
 +	mutex_unlock(&core_lock);
 +	if (WARN(id < 0, "couldn't get idr"))
 +		return id;
++=3D=3D=3D=3D=3D=3D=3D
+ 	if (id < 0)
+ 		id =3D -1;
++>>>>>>> i2c/i2c/for-next
 =20
  	adapter->nr =3D id;
 =20
@@@ -1718,7 -1719,7 +1770,7 @@@ int i2c_add_numbered_adapter(struct i2c
  	if (adap->nr =3D=3D -1) /* -1 means dynamically assign bus id */
  		return i2c_add_adapter(adap);
 =20
- 	return __i2c_add_numbered_adapter(adap);
+ 	return i2c_register_adapter(adap);
  }
  EXPORT_SYMBOL_GPL(i2c_add_numbered_adapter);
 =20

--VhpWT4J/pQpuR5IO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmooMDIACgkQJNaLcl1U
h9CaGgf/eTekX5GTEpot0BPRXfujUSMxlH5Cb8MtbYB7U+XunB2Dv7Os0CCIPR4+
FXlFEe88MSCj5EUahpOzwc1qHaJwFMu//32hXRHYJ735TKAYpijjnWx2rtQ1rVwM
3NxUPM/gfeKaMn5F/8MyoIByOADLdHH1IchBfRTs6siTpJ3eT+c/yGM7r5boCh5C
C5uoCMUpFmpl38pyrTkRy3IeyqsZ1W0Dst89gZOa4fB+Ft9dLuBlBE9CuPO0t7xT
4FVIl6gru9CrHz4FQMD12c0in/n2LQeopJfi+UvpjOLeBgUZGAyBUCO1zjXwkScf
mVge2ucotN/98yLuJidHulLPSDzC5A==
=wr4k
-----END PGP SIGNATURE-----

--VhpWT4J/pQpuR5IO--
