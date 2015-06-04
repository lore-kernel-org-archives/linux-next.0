From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Thu, 4 Jun 2015 14:51:56 +1000
Message-ID: <20150604145156.51c6924b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kbUi1x0pqv3dT57PBrOvRhD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, NeilBrown <neilb@suse.de>, Tejun Heo <tj@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/kbUi1x0pqv3dT57PBrOvRhD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
mm/backing-dev.c between commit aad653a0bc09 ("block: discard
bdi_unregister() in favour of bdi_destroy()") from Linus' tree and
various commits from the block tree.

I fixed it up (I think - see below) and can carry the fix as necessary
(no action is required - though it may be worth while merging what you
had Linus merge and fixing up the conflicts yourself).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc mm/backing-dev.c
index 000e7b3b9896,887d72a85b5e..000000000000
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@@ -387,49 -744,91 +744,75 @@@ int bdi_init(struct backing_dev_info *b
  	bdi->min_ratio =3D 0;
  	bdi->max_ratio =3D 100;
  	bdi->max_prop_frac =3D FPROP_FRAC_BASE;
- 	spin_lock_init(&bdi->wb_lock);
  	INIT_LIST_HEAD(&bdi->bdi_list);
- 	INIT_LIST_HEAD(&bdi->work_list);
+ 	init_waitqueue_head(&bdi->wb_waitq);
 =20
- 	bdi_wb_init(&bdi->wb, bdi);
+ 	err =3D wb_init(&bdi->wb, bdi, GFP_KERNEL);
+ 	if (err)
+ 		return err;
 =20
- 	for (i =3D 0; i < NR_BDI_STAT_ITEMS; i++) {
- 		err =3D percpu_counter_init(&bdi->bdi_stat[i], 0, GFP_KERNEL);
- 		if (err)
- 			goto err;
- 	}
+ 	bdi->wb_congested.state =3D 0;
+ 	bdi->wb.congested =3D &bdi->wb_congested;
 =20
- 	bdi->dirty_exceeded =3D 0;
+ 	cgwb_bdi_init(bdi);
+ 	return 0;
+ }
+ EXPORT_SYMBOL(bdi_init);
 =20
- 	bdi->bw_time_stamp =3D jiffies;
- 	bdi->written_stamp =3D 0;
+ int bdi_register(struct backing_dev_info *bdi, struct device *parent,
+ 		const char *fmt, ...)
+ {
+ 	va_list args;
+ 	struct device *dev;
 =20
- 	bdi->balanced_dirty_ratelimit =3D INIT_BW;
- 	bdi->dirty_ratelimit =3D INIT_BW;
- 	bdi->write_bandwidth =3D INIT_BW;
- 	bdi->avg_write_bandwidth =3D INIT_BW;
+ 	if (bdi->dev)	/* The driver needs to use separate queues per device */
+ 		return 0;
 =20
- 	err =3D fprop_local_init_percpu(&bdi->completions, GFP_KERNEL);
+ 	va_start(args, fmt);
+ 	dev =3D device_create_vargs(bdi_class, parent, MKDEV(0, 0), bdi, fmt, ar=
gs);
+ 	va_end(args);
+ 	if (IS_ERR(dev))
+ 		return PTR_ERR(dev);
 =20
- 	if (err) {
- err:
- 		while (i--)
- 			percpu_counter_destroy(&bdi->bdi_stat[i]);
- 	}
+ 	bdi->dev =3D dev;
 =20
- 	return err;
+ 	bdi_debug_register(bdi, dev_name(dev));
+ 	set_bit(WB_registered, &bdi->wb.state);
+=20
+ 	spin_lock_bh(&bdi_lock);
+ 	list_add_tail_rcu(&bdi->bdi_list, &bdi_list);
+ 	spin_unlock_bh(&bdi_lock);
+=20
+ 	trace_writeback_bdi_register(bdi);
+ 	return 0;
  }
- EXPORT_SYMBOL(bdi_init);
+ EXPORT_SYMBOL(bdi_register);
 =20
- void bdi_destroy(struct backing_dev_info *bdi)
+ int bdi_register_dev(struct backing_dev_info *bdi, dev_t dev)
  {
- 	int i;
+ 	return bdi_register(bdi, NULL, "%u:%u", MAJOR(dev), MINOR(dev));
+ }
+ EXPORT_SYMBOL(bdi_register_dev);
 =20
- 	bdi_wb_shutdown(bdi);
- 	bdi_set_min_ratio(bdi, 0);
+ /*
+  * Remove bdi from bdi_list, and ensure that it is no longer visible
+  */
+ static void bdi_remove_from_list(struct backing_dev_info *bdi)
+ {
+ 	spin_lock_bh(&bdi_lock);
+ 	list_del_rcu(&bdi->bdi_list);
+ 	spin_unlock_bh(&bdi_lock);
 =20
- 	WARN_ON(!list_empty(&bdi->work_list));
- 	WARN_ON(delayed_work_pending(&bdi->wb.dwork));
+ 	synchronize_rcu_expedited();
+ }
+=20
 -/*
 - * Called when the device behind @bdi has been removed or ejected.
 - *
 - * We can't really do much here except for reducing the dirty ratio at
 - * the moment.  In the future we should be able to set a flag so that
 - * the filesystem can handle errors at mark_inode_dirty time instead
 - * of only at writeback time.
 - */
 -void bdi_unregister(struct backing_dev_info *bdi)
 -{
 -	if (WARN_ON_ONCE(!bdi->dev))
 -		return;
 -
 -	bdi_set_min_ratio(bdi, 0);
 -}
 -EXPORT_SYMBOL(bdi_unregister);
 -
+ void bdi_destroy(struct backing_dev_info *bdi)
+ {
+ 	/* make sure nobody finds us on the bdi_list anymore */
+ 	bdi_remove_from_list(bdi);
+ 	wb_shutdown(&bdi->wb);
++	bdi_set_min_ratio(bdi, 0);
+ 	cgwb_bdi_destroy(bdi);
 =20
  	if (bdi->dev) {
  		bdi_debug_unregister(bdi);

--Sig_/kbUi1x0pqv3dT57PBrOvRhD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVb9lyAAoJEMDTa8Ir7ZwVh9gP/RiPznpH3HanUnqU8iB7KZBe
PDd+lqW+6EnpfLIWFfs5acs6/LmDYmYPAqxzShD8Dm09atYRbgjd9sd5Svsr/Z1i
3qNh5DZ1LBB89YfgsLihyc96yil90cimrtLqG1HXVaVzdbxbdOfhBQDKYSpl1PtL
uylvyAWKhhJuIriuDEav1TzodcWbvU83wLhBOqvFDdcL0VXn2q/KMB8iF++oRDsl
3bPPdwuSS1e9EllCOVJTIV+qVI+lw8x6JIwkLcbFG7ESwdy76uCCkiWfLGHz0alR
mXW6Y8g6dnFV0bOZNBvvtG9dtzcQfw2Mk7V39IfGznvgq26mJsgoML7zBF+FOCM9
F1uA6xNodFN9BRBxmiMUNBtgfOu5Ag1XVkuqc9qr5UhW1xFlA67rYLYVsXTQ7AdQ
0Gv3sh3NwxljB2MCI4YPZfRg7X2Dct33IJ6YeDFi4+zT6rIPG6lypRa3sb7UFlIK
B9NkpqGOeOBRCNINvvY9+NRH1jD2fSTLaTKgJQFdQTnhMwee5IyAYXq9ViiCuORd
EnTTkuYbE2PosQpqrL4C7SJmLH+wb07KruzZoC0kP2yhbxtsRdfOZXLRe3m7YKNI
YvuM06Z5TODBzaBgMaIqSZjwNFnOpbVON2wcvaxgDFd3J4HYwWESspilEavwBzoR
Ei1bGbbFaoaigRyV2yNi
=tzxk
-----END PGP SIGNATURE-----

--Sig_/kbUi1x0pqv3dT57PBrOvRhD--
