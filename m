From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Tue, 19 May 2015 16:40:40 +1000
Message-ID: <20150519164040.72e640ff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jRMA4U1gWH.AZkyprUSISuc"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Ulrich Obergfell <uobergfe@redhat.com>, Don Zickus <dzickus@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/jRMA4U1gWH.AZkyprUSISuc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
kernel/watchdog.c between commit ab992dc38f9a ("watchdog: Fix merge
'conflict'") from Linus' tree and commit fbfec4606e07
("kernel/watchdog.c: fix watchdog_nmi_enable_all()") from the
akpm-current tree.

I fixed it up (the latter is a subset of the former, so I used that -
see below) and can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc kernel/watchdog.c
index 506edcc500c4,93ef2bad457c..000000000000
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@@ -610,36 -615,26 +617,36 @@@ void watchdog_nmi_enable_all(void
  {
  	int cpu;
 =20
 +	mutex_lock(&watchdog_proc_mutex);
 +
  	if (!(watchdog_enabled & NMI_WATCHDOG_ENABLED))
 -		return;
 +		goto unlock;
 =20
  	get_online_cpus();
- 	for_each_online_cpu(cpu)
+ 	for_each_watchdog_cpu(cpu)
  		watchdog_nmi_enable(cpu);
  	put_online_cpus();
 +
 +unlock:
 +	mutex_lock(&watchdog_proc_mutex);
  }
 =20
  void watchdog_nmi_disable_all(void)
  {
  	int cpu;
 =20
 +	mutex_lock(&watchdog_proc_mutex);
 +
  	if (!watchdog_running)
 -		return;
 +		goto unlock;
 =20
  	get_online_cpus();
- 	for_each_online_cpu(cpu)
+ 	for_each_watchdog_cpu(cpu)
  		watchdog_nmi_disable(cpu);
  	put_online_cpus();
 +
 +unlock:
 +	mutex_unlock(&watchdog_proc_mutex);
  }
  #else
  static int watchdog_nmi_enable(unsigned int cpu) { return 0; }

--Sig_/jRMA4U1gWH.AZkyprUSISuc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVWtrtAAoJEMDTa8Ir7ZwV4YYP/0bz/yeOai5hj+K7kTNHD4ll
cM7CAv/TBsHZ6k2eJeoJIHbT9Ed7WQzJBDQjz12smnsosT+NxyWDTneh49ZlPER8
jK3ftkltBuck8w+UmqNoa/K3/2QpaGoe0AxMdET6ScatfGse3a9yWnWbjCrH0XNE
ey/WO9u+y+S0URYPHRb+1zLT5D87iBA1PAEQ9S/x251p/k0iclxDS1S0CDuUFI5N
R/SrIb8d+MNbPAT9u0qx0nNy0sBJm2jPmBwibCPdyuUacLnSP0+FGZw5i9s94ozD
qOaIqfvivXhO2BpK1EZqCuLlR5cXcNEGcjRenjH81XJnObEkJV8MaqCKePm61g96
9EC1XIGb4zMX+VGLN14Hn7CGUsow5alHeTuaxOAC5j0O9EF62ZogpXZQDq0PoX7R
gp8kXJfbeT59deUm2+y94bIb+sD/N/9ulcL8+hjkNK9Mxqa6+OnnBFrc3agjr6Nj
ejI/HZlHEGIPNcwQ31aGuxK1sHYisMcVklaP0njeeCnNm8be3vF3RSq07Kd6kl79
UXy/jatUdKEoXjtSdoH9/U6eN+wHoGY3rvG+jJhZBg9ujXD8jcYmA2v+F4cQW1o8
genQ9snE8PzkzYPKixjqgRn+M25eOQdoS16ERPfk1RYgOeNWC2pTVf2J7jNYjhUX
99fabjzOJbmYtCT7GxG7
=On7Y
-----END PGP SIGNATURE-----

--Sig_/jRMA4U1gWH.AZkyprUSISuc--
