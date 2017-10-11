From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the tip tree with the FIXME tree
Date: Wed, 11 Oct 2017 17:10:35 +0100
Message-ID: <20171011161035.sudulg5gpvw4lp4o@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k3ts6zqpuhex6zfe"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--k3ts6zqpuhex6zfe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/s390/include/asm/spinlock.h

between a series of commits adding wait queuing to s390 spinlocks
=66rom the s390 tree:

eb3b7b848fb3dd00f7a57d633 s390/rwlock: introduce rwlock wait queueing
b96f7d881ad94203e997cd2aa s390/spinlock: introduce spinlock wait queueing
8153380379ecc8381f6d55f64 s390/spinlock: use the cpu number +1 as spinlock =
value

and Will's series of commits removing dummy implementations of spinlock
related things from the tip tree:

a4c1887d4c1462b0ec5a8989f locking/arch: Remove dummy arch_{read,spin,write}=
_lock_flags() implementations
0160fb177d484367e041ac251 locking/arch: Remove dummy arch_{read,spin,write}=
_relax() implementations
a8a217c22116eff6c120d753c locking/core: Remove {read,spin,write}_can_lock()

I'm don't feel confident I can resolve this conflict sensibly without
taking too long so I've used the tip tree from yesterday.

--k3ts6zqpuhex6zfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlneQnoACgkQJNaLcl1U
h9CGeQf/TbbP1PvYSh5hMXyR6X5unaeMIYfYs7MByaNMHSr/lm75+AYx6bLY0igg
GaVE4bc3P8Fv38L5NVyZ9EqoOhBu8K4G+M9fPMKa6rgn9hc7imQ24y3l+7P+cRZV
K2DIoUQUsM9G/HXxyScrxflS7q9emPx7GAfmiNa/ivWDrqtnFAPId/gR3WMYFt7I
OB/F0dtCP+efzY9pV7abFXnyMHW/Pk7xhoyKnKdHKB7w+4y5HRoXulDsZzhHkMyu
zgywV9KKRFu2ha3VHOCL1uWK7AXSRm/v608WfPuX6+sao+x6pKSqMATKjw2Kn3by
FMB+rW4LU9bglzN6+KnsuaMesjSFiQ==
=PE1N
-----END PGP SIGNATURE-----

--k3ts6zqpuhex6zfe--
