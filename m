From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the timers tree
Date: Tue, 14 Oct 2008 17:12:01 +1100
Message-ID: <20081014171201.b943052a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_17_12_01_+1100_CFMcbMskFcsgme9S"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46505 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756407AbYJNHFi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 03:05:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yhlu.kernel@gmail.com>

--Signature=_Tue__14_Oct_2008_17_12_01_+1100_CFMcbMskFcsgme9S
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the timers tree got a conflict in
kernel/irq/chip.c between commit 0c5d1eb77a8be917b638344a22afe1398236482b
("genirq: record trigger type") from Linus' tree and commit
f2f61d198649e25e4ddce33f716729eae1aab02b ("generic: sparse irqs: use
irq_desc() together with dyn_array, instead of irq_desc[]") from the
timers tree.

I fixed it up (see below).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/irq/chip.c
index 5203a59,5a3f73e..0000000
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@@ -126,13 -128,11 +128,12 @@@ int set_irq_type(unsigned int irq, unsi
  		return -ENODEV;
  	}
 =20
- 	desc =3D irq_desc + irq;
 -	if (desc->chip->set_type) {
 -		spin_lock_irqsave(&desc->lock, flags);
 -		ret =3D desc->chip->set_type(irq, type);
 -		spin_unlock_irqrestore(&desc->lock, flags);
 -	}
 +	if (type =3D=3D IRQ_TYPE_NONE)
 +		return 0;
 +
 +	spin_lock_irqsave(&desc->lock, flags);
 +	ret =3D __irq_set_trigger(desc, irq, flags);
 +	spin_unlock_irqrestore(&desc->lock, flags);
  	return ret;
  }
  EXPORT_SYMBOL(set_irq_type);

--Signature=_Tue__14_Oct_2008_17_12_01_+1100_CFMcbMskFcsgme9S
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0ODEACgkQjjKRsyhoI8yk6gCeMpmVQzCbWtCthclwzk3lQkv6
yasAn0yN6i22+XEVZpU9w9qG5WBbpKSj
=ji4k
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_17_12_01_+1100_CFMcbMskFcsgme9S--
