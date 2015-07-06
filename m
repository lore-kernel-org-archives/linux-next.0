From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Date: Mon, 6 Jul 2015 10:08:58 +1000
Message-ID: <20150706100858.649532b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+2AWsTet09zD=_blgrPym6X"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55376 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751159AbbGFAJF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 5 Jul 2015 20:09:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>

--Sig_/+2AWsTet09zD=_blgrPym6X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  kernel/sched/core.c

between commit:

  2ecd9d29abb1 ("sched, preempt_notifier: separate notifier registration fr=
om static_key inc/dec")

from Linus' tree and commit:

  6efde1d3716b ("sched/preempt, kvm: Fix KVM preempt_notifier usage")

from the tip tree.

I fixed it up (maybe - see below) and can carry the fix as necessary
(no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc kernel/sched/core.c
index 78b4bad10081,850e54b89a11..000000000000
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@@ -2338,10 -2326,13 +2338,15 @@@ EXPORT_SYMBOL_GPL(preempt_notifier_dec)
   */
  void preempt_notifier_register(struct preempt_notifier *notifier)
  {
 -	static_key_slow_inc(&preempt_notifier_key);
 +	if (!static_key_false(&preempt_notifier_key))
 +		WARN(1, "registering preempt_notifier while notifiers disabled\n");
 +
+ 	/*
+ 	 * Avoid preemption while changing the preempt notifier list.
+ 	 */
+ 	preempt_disable();
  	hlist_add_head(&notifier->link, &current->preempt_notifiers);
+ 	preempt_enable();
  }
  EXPORT_SYMBOL_GPL(preempt_notifier_register);
 =20
@@@ -2353,7 -2344,14 +2358,12 @@@
   */
  void preempt_notifier_unregister(struct preempt_notifier *notifier)
  {
+ 	/*
+ 	 * Avoid preemption while changing the preempt notifier list.
+ 	 */
+ 	preempt_disable();
  	hlist_del(&notifier->link);
+ 	preempt_enable();
 -
 -	static_key_slow_dec(&preempt_notifier_key);
  }
  EXPORT_SYMBOL_GPL(preempt_notifier_unregister);
 =20

--Sig_/+2AWsTet09zD=_blgrPym6X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVmccfAAoJEMDTa8Ir7ZwVJ88P/jyZ+LSsu94hgZYaDuZurAzc
QmA3rEeRX0ECoHTummOkoEafKN7/nRg7wcmrAt4fVeXB2DQgU/7gFicohcDJLR/J
SkCWD/0pin6MsYRNOxu70HY731eLdge1uHcmCQnDF1yMJLN9EeiCTTSBYL0nnEBY
OykqoEmm8op16qnX7Hd1PaIFunPkXILv+2RKmkkvDXdJ0wtZXQpXT6jFyVclK/wu
q+oGsS1ZBiQhiyRnySTcEkUkftzGjC7sde6/6r+LjX8Nuxre9R/OGNXYi0l492JL
hRWHSZRLJ0vymHrfRhP4j7S0DvRCUsnRsl/DJrIIRpT58P52iaxej60BBwJcPQYi
jRLCT6YWKmqIr8yTKxYs5FuULmFmzJZfixwOtelEDwjeLovmFi67HGFXPdUAuiSo
5FEkNuoJBUKEbf3cIsWktvD53Izr60MEeKochGFGk5zlFNcm2JosfwR10DltIxTs
QIIk0q13lx9gUh097ELgAi21GF5BdUTxc2cDzW92VGJWnPlDTQK2JPWrU4ACFLga
U32QkfrQ/npWLSE5EDn4MQtVf1G4PaKv3Auf6pgostEJCaE8WOuHrOrL12Lyf74e
irDD2mzZhwu0rl/LQli7Y9Tu+lo50dQ+JzA1MuBDY4JIBnS5dokghqYCuvtSFazg
6ZSBD9BS8bXmO7g/LfCs
=uY/Y
-----END PGP SIGNATURE-----

--Sig_/+2AWsTet09zD=_blgrPym6X--
