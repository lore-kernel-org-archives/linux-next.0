From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the pm tree
Date: Tue, 31 Mar 2015 18:58:44 +1100
Message-ID: <20150331185844.69a6703d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/w0SNzeb4iHCj4WyB0Ki7oqp"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52857 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750781AbbCaH6v (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Mar 2015 03:58:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>

--Sig_/w0SNzeb4iHCj4WyB0Ki7oqp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got conflicts in
include/linux/clockchips.h, kernel/time/tick-broadcast.c,
kernel/time/tick-common.c and kernel/time/tick-internal.h between
commit 01b9fdf7e540 ("tick: Move core only declarations and functions
to core") (and others) from the pm tree and commit 77e32c89a711
("clockevents: Manage device's state separately for the core") (and
others) from the tip tree.

I fixed it up (I *think* I may have figured it all out, but please
check - see below and teh final tree later) and can carry the fix as
necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/clockchips.h
index 4350d7101982,e20232c3320a..000000000000
--- a/include/linux/clockchips.h
+++ b/include/linux/clockchips.h
diff --cc kernel/time/tick-broadcast.c
index f8e27cd0b7ab,f0f8ee9dbc28..000000000000
--- a/kernel/time/tick-broadcast.c
+++ b/kernel/time/tick-broadcast.c
@@@ -553,9 -541,10 +553,9 @@@ static int tick_broadcast_set_event(str
  	return ret;
  }
 =20
 -int tick_resume_broadcast_oneshot(struct clock_event_device *bc)
 +static void tick_resume_broadcast_oneshot(struct clock_event_device *bc)
  {
- 	clockevents_set_mode(bc, CLOCK_EVT_MODE_ONESHOT);
+ 	clockevents_set_state(bc, CLOCK_EVT_STATE_ONESHOT);
 -	return 0;
  }
 =20
  /*
diff --cc kernel/time/tick-common.c
index d9e769e31ee4,a5b877130ae9..000000000000
--- a/kernel/time/tick-common.c
+++ b/kernel/time/tick-common.c
@@@ -386,19 -380,13 +387,20 @@@ void tick_suspend_local(void
  	clockevents_shutdown(td->evtdev);
  }
 =20
 -void tick_resume(void)
 +/**
 + * tick_resume_local - Resume the local tick device
 + *
 + * Called from the local CPU for unfreeze or XEN resume magic.
 + *
 + * No locks required. Nothing can change the per cpu device.
 + */
 +void tick_resume_local(void)
  {
  	struct tick_device *td =3D this_cpu_ptr(&tick_cpu_device);
 -	int broadcast =3D tick_resume_broadcast();
 +	bool broadcast =3D tick_resume_check_broadcast();
 =20
- 	clockevents_set_mode(td->evtdev, CLOCK_EVT_MODE_RESUME);
+ 	clockevents_tick_resume(td->evtdev);
+=20
  	if (!broadcast) {
  		if (td->mode =3D=3D TICKDEV_MODE_PERIODIC)
  			tick_setup_periodic(td->evtdev, 0);
diff --cc kernel/time/tick-internal.h
index 1c7560a533d5,98700e4a2000..000000000000
--- a/kernel/time/tick-internal.h
+++ b/kernel/time/tick-internal.h
@@@ -27,31 -30,15 +27,32 @@@ extern void tick_resume(void)
  extern bool tick_check_replacement(struct clock_event_device *curdev,
  				   struct clock_event_device *newdev);
  extern void tick_install_replacement(struct clock_event_device *dev);
 +extern int tick_is_oneshot_available(void);
 +extern struct tick_device *tick_get_device(int cpu);
 +
 +/* Check, if the device is functional or a dummy for broadcast */
 +static inline int tick_device_is_functional(struct clock_event_device *de=
v)
 +{
 +	return !(dev->features & CLOCK_EVT_FEAT_DUMMY);
 +}
 =20
  extern void clockevents_shutdown(struct clock_event_device *dev);
+ extern int clockevents_tick_resume(struct clock_event_device *dev);
 -
 +extern void clockevents_exchange_device(struct clock_event_device *old,
 +					struct clock_event_device *new);
- extern void clockevents_set_mode(struct clock_event_device *dev,
- 				 enum clock_event_mode mode);
++extern void clockevents_set_state(struct clock_event_device *dev,
++				  enum clock_event_state state);
 +extern int clockevents_program_event(struct clock_event_device *dev,
 +				     ktime_t expires, bool force);
 +extern void clockevents_handle_noop(struct clock_event_device *dev);
 +extern int __clockevents_update_freq(struct clock_event_device *dev, u32 =
freq);
  extern ssize_t sysfs_get_uname(const char *buf, char *dst, size_t cnt);
 +#else
 +static inline void tick_suspend(void) { }
 +static inline void tick_resume(void) { }
 +#endif /* GENERIC_CLOCKEVENTS */
 =20
 -/*
 - * NO_HZ / high resolution timer shared code
 - */
 +/* Oneshot related functions */
  #ifdef CONFIG_TICK_ONESHOT
  extern void tick_setup_oneshot(struct clock_event_device *newdev,
  			       void (*handler)(struct clock_event_device *),

--Sig_/w0SNzeb4iHCj4WyB0Ki7oqp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVGlO5AAoJEMDTa8Ir7ZwVFdUP/2hqd8+4F0UHuoB7LuUMmjmb
8pRoRF12Ni5bt51WyLdbKygNo85o03+WUDR2PfHBef4Hox9d3pBjWHs6Wu/jBqde
Wby5k0HGiaBaAKvZZWE9GTYMky+Cy7hYKQJ248t/1sFLPXsKR4jvOJttbLCom8Go
PPpq5wehF2IfWhVSyecz+59G4CighgeekQrwnlQ5opjLhbslBYfflDmzh2t1Tn8g
Rq4CVBao8VghKlB8x6O9ybtId8GhpG3AddERtsPlq1bjFwAuc2i1a8g2tlBkUQuZ
UOT+czlmk3uch4ZM3AzbtVdm6UfWCB5OTvauXk1JUXzk+eeLdMbz5SpkBAoBY2ur
KrpgSVaGKGWL7aKFpTxwSFBhemBHGbcOgOXQK56bYBHpgBQtpnA8ywZCVbHiEce7
FHr+OERW28SarTp1MbHXEi1IsEeCytOWBAa3SzGgd382AadLJpyQdfOgNMQgNrDR
VheqUiPu4pIDle7mxV4M+4YB+GI/YlAke1ebBOu+5TSVAVgCzD0iQYs8NfzrkauZ
kCPAOPfwEHujMl4BR5RJNqDy+AfiaTgV0ejXXXT4GUaouvi4filhPqCLibKY2co3
E0dNmQpiB/dCdeo+2l04SI/KnML/uEPelIOzjtXWOb0P+w4R6bZFPSUqVGCDnZbs
BEY/1XfZnBRyMrwikPdC
=RSzJ
-----END PGP SIGNATURE-----

--Sig_/w0SNzeb4iHCj4WyB0Ki7oqp--
