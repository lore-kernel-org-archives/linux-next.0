Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E9C441638;
	Thu, 30 Jul 2026 14:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422333; cv=none; b=ICFMFhEjtShmSS/XuEVEfgAJmTamgcvSoIv2rmKLCcKADoMDwaBwfSziwlsASmYIBDsoCZ+cS0FT/KNbZ6DtzBIK70g1U8dgDZiUsmAPi7Ee93qtxIZUuir0Pw1qcMD+ldMe6fxy/e7AZTrcaxYjr2JVoIDhArM/99kgGFkbM9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422333; c=relaxed/simple;
	bh=6vkDQK2Y/lvWL9BURZ7/pZI8cjLObDmuzVgpVOmGiL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BhReHPUj69OnnjsuAsrnlYa+t0HC0RXFShKE7nSZaWV2vHBnMJTPbnWz2FFbtaTaU1HKyRBdXwvxeMGN9P2noZBTxow7qf5jXOCYcHreyoL3eOCs80UWsGh6hxBcojsFSVcqj0ffHltFxOOlYEHBOEMTGX3LKVVKkkk3k49EKok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRX+RwIU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRX+RwIU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8211F00A3E;
	Thu, 30 Jul 2026 14:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785422332;
	bh=pR6XHwtO9/85zpqtsCD2s4uEPgXoHt4IwaW5wIa8kCY=;
	h=Date:From:To:Cc:Subject;
	b=FRX+RwIUD8/OYU693K89yF8zGjkOiElea+cKjSyUta3xak+acxIoCNFuiYj45LyJ0
	 97JAzOZCnEF4zb0BfKlXXcxLinruzQXXXxJur4k9CKu92/QFUYo8LdDwvQpmfuf67l
	 htZ+l7+a03j43cgfAMkZYaoPuXlxKWZurNOLBTYf5mnKsewRILnsGyNVZyKJT3GZwA
	 6WBA64cXwkHWrcxBoz2O785NilKXR40iGwTeMLr0FocrOeeQ1RZAmmWXT4jaHa8OoQ
	 KiLSgtbZkNsjBGpn/azzp5DIGt7cV1rTIHtjIKHnSngpxP31TQZ45954EdxqryGT66
	 Fu0hk52wnYPrg==
Date: Thu, 30 Jul 2026 15:38:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Harry Yoo <harry@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: linux-next: manual merge of the slab tree with the rcu tree
Message-ID: <amth-CMf3Xz5hR32@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5Wf0lg24bFQIdPKI"
Content-Disposition: inline


--5Wf0lg24bFQIdPKI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the slab tree got a conflict in:

  mm/slab_common.c

between commit:

  736084507faa3 ("rcu: Rename struct rcu_gp_oldstate to rcu_gp_seq")

=66rom the rcu tree and commit:

  bdd0cc9f0ffc3 ("mm/slab: introduce struct kvfree_rcu_head for kvfree_rcu =
batching")

=66rom the slab tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc mm/slab_common.c
index 657fd75776ea7,b8f21eabcccc2..0000000000000
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@@ -1363,8 -1420,8 +1420,8 @@@ struct kvfree_rcu_bulk_data=20
 =20
  struct kfree_rcu_cpu_work {
  	struct rcu_work rcu_work;
- 	struct rcu_head *head_free;
+ 	struct kvfree_rcu_head *head_free;
 -	struct rcu_gp_oldstate head_free_gp_snap;
 +	struct rcu_gp_seq head_free_gp_snap;
  	struct list_head bulk_head_free[FREE_N_CHANNELS];
  	struct kfree_rcu_cpu *krcp;
  };
@@@ -1569,10 -1626,10 +1626,10 @@@ static void kfree_rcu_work(struct work_
  	unsigned long flags;
  	struct kvfree_rcu_bulk_data *bnode, *n;
  	struct list_head bulk_head[FREE_N_CHANNELS];
- 	struct rcu_head *head;
+ 	struct kvfree_rcu_head *head;
  	struct kfree_rcu_cpu *krcp;
  	struct kfree_rcu_cpu_work *krwp;
 -	struct rcu_gp_oldstate head_gp_snap;
 +	struct rcu_gp_seq head_gp_snap;
  	int i;
 =20
  	krwp =3D container_of(to_rcu_work(work),

--5Wf0lg24bFQIdPKI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmprYfcACgkQJNaLcl1U
h9BdWgf7BJef6/murj4p2SqRvXCzjDlZgnsjt0mmZSffRJiEq8AV56BpoCuqMIrF
nzQumaKylFEIk0xRF7SoSUDnK3/hhSYbOD0jxvaeCveubKaYeDZzDm4z9MrwiEnK
t9AHPl5/RGK2VjMqOzBddiqpOqluaIyPDCaP5Op48F/DSyg/wwoSyuu5p1jtV8AF
nO9fgQHYKeRanhUbo45YW79LJtCdfHxzCi/a5xTn4uJiIPZJa9uPFWdZQVfzoPRO
MJzBA8HjOVTYXsK+ZEFdcFdQZqE8/IRQIHOlTTjYg++bOoTaPcr9pweXfECJYJGk
SJFLCsFr+TySKvnpj0wb9fiUbC3E6Q==
=Gfti
-----END PGP SIGNATURE-----

--5Wf0lg24bFQIdPKI--
