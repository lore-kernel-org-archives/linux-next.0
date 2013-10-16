From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: linux-next: manual merge of the tip tree
Date: Wed, 16 Oct 2013 22:44:37 +0200
Message-ID: <20131016204436.GC6579@mithrandir>
References: <1381949500-501-1-git-send-email-treding@nvidia.com>
 <1381949500-501-2-git-send-email-treding@nvidia.com>
 <20131016200645.GD10651@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131016200645.GD10651@twins.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Shaohua Li <shli@kernel.org>, NeilBrown <neilb@suse.de>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2013 at 10:06:45PM +0200, Peter Zijlstra wrote:
> On Wed, Oct 16, 2013 at 08:51:39PM +0200, Thierry Reding wrote:
> > Today's linux-next merge of the tip tree got a conflict in
> >=20
> > 	include/linux/wait.h
> >=20
> > caused by commits 1ab2460 (wait: add wait_event_cmd()) and fb869b6
> > (sched/wait: Clean up wait.h details a bit).
>=20
> Gargh, where did that come from?!

FWIW, commit 1ab2460 came in through Neil's md tree.

Thierry

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXvq0AAoJEN0jrNd/PrOhCSwP/2hGQ2o+YfJp34jfd2HnZ+VE
qXK2760KP2DaZfCuiXfemNAe+KxPD+rzgP8KJ+IpzlR4sYuezPcsIR1/6gLl0L5c
+3rYJsm6UYK4vpcAik+h9pFg0EFarjpDikeRBYXxNKnwFFi1PjrG+mq2sj1KtPWq
MFI9sTlZ90MFmz3X5TwjyWCzeThRM29l6Rj5H1ZChoOUm3nbyG8CN3TgJFF9wKLB
E08Ji+Zvxa+DDP95VaNhQSyJVRsFeE/k9V94sLDUHa92kVCGfbml7KAbSmmbjdwV
qY2T9P8XlP4xQHLfS7Wwdsx9rxStFpsMRyvRpnUtLGInGIa8SWmuANXFcZ9hZG7h
x7mwaJVPSBO0xBMnO6P4AJkDomORK2iMfUXDuU7TcuvzY62G/DcWJZG0KMI1Tr3I
eusfKh5k0tdMGK6Hm+UzYLL4aW3Q6JRxphvTUJ52bvTxUSDWAx6OE+bv+swY4FFT
EVLYxnFEM56Lwq2BtuxagMdoP/9hKvW3p0s5xcYe4kh9fHvd0u6pHTawZZZFXDX8
KZElti4fllM02+WhPSd1KfEyKrJLtBbxQgruxoCpSBR35hYzo/rDuOv6km/2gR2e
l50dz+oT+e7SWD9O6TwoncZ3ThLzPCIc9SGWm+S3oDLBnc1kWesqIQuBu+sOZCpx
T5y3I7kIKIa0t+Y1gbT8
=X6yq
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--
