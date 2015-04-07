From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tile
 tree
Date: Tue, 7 Apr 2015 21:21:53 +1000
Message-ID: <20150407212153.33327869@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iRHb79xx/=b=VvsdWCba3Bt"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Chris Metcalf <cmetcalf@ezchip.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ulrich Obergfell <uobergfe@redhat.com>, Don Zickus <dzickus@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/iRHb79xx/=b=VvsdWCba3Bt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
kernel/watchdog.c between commit e164ade07b21 ("watchdog: add
watchdog_exclude sysctl to assist nohz") from the tile tree and commits
e0afaab242da ("watchdog: introduce separate handlers for parameters
in /proc/sys/kernel"), 866d62a433cc ("watchdog: enable the new user
interface of the watchdog mechanism") and 09d1b2261fcc ("watchdog:
clean up some function names and arguments") from the akpm-current tree.

I fixed it up (see below, but it may need more work) and can carry the
fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc kernel/watchdog.c
index 083bd9007b3e,f2be11ab7e08..000000000000
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@@ -656,90 -693,160 +696,191 @@@ static void watchdog_disable_all_cpus(v
  	}
  }
 =20
 +static DEFINE_MUTEX(watchdog_proc_mutex);
 +
  /*
-  * proc handler for /proc/sys/kernel/nmi_watchdog,watchdog_thresh
+  * Update the run state of the lockup detectors.
   */
+ static int proc_watchdog_update(void)
+ {
+ 	int err =3D 0;
+=20
+ 	/*
+ 	 * Watchdog threads won't be started if they are already active.
+ 	 * The 'watchdog_running' variable in watchdog_*_all_cpus() takes
+ 	 * care of this. If those threads are already active, the sample
+ 	 * period will be updated and the lockup detectors will be enabled
+ 	 * or disabled 'on the fly'.
+ 	 */
+ 	if (watchdog_enabled && watchdog_thresh)
+ 		err =3D watchdog_enable_all_cpus();
+ 	else
+ 		watchdog_disable_all_cpus();
+=20
+ 	return err;
+=20
+ }
+=20
+ static DEFINE_MUTEX(watchdog_proc_mutex);
 =20
- int proc_dowatchdog(struct ctl_table *table, int write,
- 		    void __user *buffer, size_t *lenp, loff_t *ppos)
+ /*
+  * common function for watchdog, nmi_watchdog and soft_watchdog parameter
+  *
+  * caller             | table->data points to | 'which' contains the flag=
(s)
+  * -------------------|-----------------------|--------------------------=
---
+  * proc_watchdog      | watchdog_user_enabled | NMI_WATCHDOG_ENABLED or'ed
+  *                    |                       | with SOFT_WATCHDOG_ENABLED
+  * -------------------|-----------------------|--------------------------=
---
+  * proc_nmi_watchdog  | nmi_watchdog_enabled  | NMI_WATCHDOG_ENABLED
+  * -------------------|-----------------------|--------------------------=
---
+  * proc_soft_watchdog | soft_watchdog_enabled | SOFT_WATCHDOG_ENABLED
+  */
+ static int proc_watchdog_common(int which, struct ctl_table *table, int w=
rite,
+ 				void __user *buffer, size_t *lenp, loff_t *ppos)
  {
- 	int err, old_thresh, old_enabled;
- 	bool old_hardlockup;
+ 	int err, old, new;
+ 	int *watchdog_param =3D (int *)table->data;
 =20
  	mutex_lock(&watchdog_proc_mutex);
- 	old_thresh =3D ACCESS_ONCE(watchdog_thresh);
- 	old_enabled =3D ACCESS_ONCE(watchdog_user_enabled);
- 	old_hardlockup =3D watchdog_hardlockup_detector_is_enabled();
 =20
- 	err =3D proc_dointvec_minmax(table, write, buffer, lenp, ppos);
- 	if (err || !write)
- 		goto out;
-=20
- 	set_sample_period();
  	/*
- 	 * Watchdog threads shouldn't be enabled if they are
- 	 * disabled. The 'watchdog_running' variable check in
- 	 * watchdog_*_all_cpus() function takes care of this.
+ 	 * If the parameter is being read return the state of the corresponding
+ 	 * bit(s) in 'watchdog_enabled', else update 'watchdog_enabled' and the
+ 	 * run state of the lockup detectors.
  	 */
- 	if (watchdog_user_enabled && watchdog_thresh) {
+ 	if (!write) {
+ 		*watchdog_param =3D (watchdog_enabled & which) !=3D 0;
+ 		err =3D proc_dointvec_minmax(table, write, buffer, lenp, ppos);
+ 	} else {
+ 		err =3D proc_dointvec_minmax(table, write, buffer, lenp, ppos);
+ 		if (err)
+ 			goto out;
+=20
  		/*
- 		 * Prevent a change in watchdog_thresh accidentally overriding
- 		 * the enablement of the hardlockup detector.
+ 		 * There is a race window between fetching the current value
+ 		 * from 'watchdog_enabled' and storing the new value. During
+ 		 * this race window, watchdog_nmi_enable() can sneak in and
+ 		 * clear the NMI_WATCHDOG_ENABLED bit in 'watchdog_enabled'.
+ 		 * The 'cmpxchg' detects this race and the loop retries.
  		 */
- 		if (watchdog_user_enabled !=3D old_enabled)
- 			watchdog_enable_hardlockup_detector(true);
- 		err =3D watchdog_enable_all_cpus(old_thresh !=3D watchdog_thresh);
- 	} else
- 		watchdog_disable_all_cpus();
+ 		do {
+ 			old =3D watchdog_enabled;
+ 			/*
+ 			 * If the parameter value is not zero set the
+ 			 * corresponding bit(s), else clear it(them).
+ 			 */
+ 			if (*watchdog_param)
+ 				new =3D old | which;
+ 			else
+ 				new =3D old & ~which;
+ 		} while (cmpxchg(&watchdog_enabled, old, new) !=3D old);
 =20
- 	/* Restore old values on failure */
- 	if (err) {
- 		watchdog_thresh =3D old_thresh;
- 		watchdog_user_enabled =3D old_enabled;
- 		watchdog_enable_hardlockup_detector(old_hardlockup);
+ 		/*
+ 		 * Update the run state of the lockup detectors.
+ 		 * Restore 'watchdog_enabled' on failure.
+ 		 */
+ 		err =3D proc_watchdog_update();
+ 		if (err)
+ 			watchdog_enabled =3D old;
  	}
  out:
  	mutex_unlock(&watchdog_proc_mutex);
  	return err;
  }
 =20
 +int proc_dowatchdog_exclude(struct ctl_table *table, int write,
 +			    void __user *buffer, size_t *lenp, loff_t *ppos)
 +{
 +	int err;
 +
 +	mutex_lock(&watchdog_proc_mutex);
 +	err =3D proc_do_large_bitmap(table, write, buffer, lenp, ppos);
 +	if (!err && write && watchdog_user_enabled) {
 +		watchdog_disable_all_cpus();
- 		watchdog_enable_all_cpus(false);
++		watchdog_enable_all_cpus();
 +	}
 +	mutex_unlock(&watchdog_proc_mutex);
 +	return err;
 +}
 +
+ /*
+  * /proc/sys/kernel/watchdog
+  */
+ int proc_watchdog(struct ctl_table *table, int write,
+ 		  void __user *buffer, size_t *lenp, loff_t *ppos)
+ {
+ 	return proc_watchdog_common(NMI_WATCHDOG_ENABLED|SOFT_WATCHDOG_ENABLED,
+ 				    table, write, buffer, lenp, ppos);
+ }
+=20
+ /*
+  * /proc/sys/kernel/nmi_watchdog
+  */
+ int proc_nmi_watchdog(struct ctl_table *table, int write,
+ 		      void __user *buffer, size_t *lenp, loff_t *ppos)
+ {
+ 	return proc_watchdog_common(NMI_WATCHDOG_ENABLED,
+ 				    table, write, buffer, lenp, ppos);
+ }
+=20
+ /*
+  * /proc/sys/kernel/soft_watchdog
+  */
+ int proc_soft_watchdog(struct ctl_table *table, int write,
+ 			void __user *buffer, size_t *lenp, loff_t *ppos)
+ {
+ 	return proc_watchdog_common(SOFT_WATCHDOG_ENABLED,
+ 				    table, write, buffer, lenp, ppos);
+ }
+=20
+ /*
+  * /proc/sys/kernel/watchdog_thresh
+  */
+ int proc_watchdog_thresh(struct ctl_table *table, int write,
+ 			 void __user *buffer, size_t *lenp, loff_t *ppos)
+ {
+ 	int err, old;
+=20
+ 	mutex_lock(&watchdog_proc_mutex);
+=20
+ 	old =3D ACCESS_ONCE(watchdog_thresh);
+ 	err =3D proc_dointvec_minmax(table, write, buffer, lenp, ppos);
+=20
+ 	if (err || !write)
+ 		goto out;
+=20
+ 	/*
+ 	 * Update the sample period.
+ 	 * Restore 'watchdog_thresh' on failure.
+ 	 */
+ 	set_sample_period();
+ 	err =3D proc_watchdog_update();
+ 	if (err)
+ 		watchdog_thresh =3D old;
+ out:
+ 	mutex_unlock(&watchdog_proc_mutex);
+ 	return err;
+ }
  #endif /* CONFIG_SYSCTL */
 =20
  void __init lockup_detector_init(void)
  {
  	set_sample_period();
 =20
 +	alloc_bootmem_cpumask_var(&watchdog_exclude_mask);
 +	watchdog_threads.exclude_mask =3D watchdog_exclude_mask;
 +
 +#ifdef CONFIG_NO_HZ_FULL
 +	if (!cpumask_empty(tick_nohz_full_mask))
 +		pr_info("Disabling watchdog on nohz_full cores by default\n");
 +	cpumask_copy(watchdog_exclude_mask, tick_nohz_full_mask);
 +#else
 +	cpumask_clear(watchdog_exclude_mask);
 +#endif
 +
 +	/* The sysctl API requires a variable holding a pointer to the mask. */
 +	watchdog_exclude_mask_bits =3D cpumask_bits(watchdog_exclude_mask);
 +
- 	if (watchdog_user_enabled)
- 		watchdog_enable_all_cpus(false);
+ 	if (watchdog_enabled)
+ 		watchdog_enable_all_cpus();
  }

--Sig_/iRHb79xx/=b=VvsdWCba3Bt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVI73VAAoJEMDTa8Ir7ZwVXXIP/j9MsRagTbVGR+mBijyA6XLu
I1L8viIjDTC5lTB1+PM5zduVzZV/rIh8qbTbuz2EB3yqO/X17LhM6Q5e1WGW/561
0GKw+zbasdHR7ofA4VZrtQDn8dS7Pwn7WUOlcVUURxPFtX6+m6Dt4ApPvwwO4Fnm
0EIuk6IpA2WJ3xp8RsPtxsUaDbCDkXfzqCN0ru0kqcHvH5klLLm+ek0Vi8032pVW
8ZVBilZJL8pHqMjWb827ZPBGjkApobln9FBUmrYomF2jRgL2r/RQp+xHoYZL4ts2
Vgt4moC0Nzyxwih3FYvWUKyedZV9c6TWMMiPbPj+UB4XGQi2o76rCUttHI4nxOXX
XXZRCsaQBVnjDcsHzQFVVeAa9kFRLuWWUB2q7spcGA6PAbvPWeXAMj6syR2EO7bP
dq7LMob/WeL21v5OO903Jp6OWafJ6nSXZGXcmqb2Vr8/6kP9z8OueybfV4U1/YRP
D5DJeVrOpUOR3xpH48eYROIRh7/ezHEKWGxZGcO0Gqd3NAkoar7Ll9d4aWxvAxOK
RTjnaBrLSbosTQiQwROyCc1AURmsWMl91vQMZG2JcmKTP4c1/qwC5WcTxm5pMqXe
oh3nM14q2HjYzsB0jjIg7I9A8kqYb7RGgrCvVUsFgfPNanXX9okpE4a3yNg+5wDw
JErGZQ2eC/yPVD+9gZoX
=I/J/
-----END PGP SIGNATURE-----

--Sig_/iRHb79xx/=b=VvsdWCba3Bt--
