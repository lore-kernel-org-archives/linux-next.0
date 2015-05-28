From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the sparc tree
Date: Thu, 28 May 2015 16:38:46 +1000
Message-ID: <20150528163846.05f47bd6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8UbiCNBoq+7obPbjxZs63p2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, chris hyser <chris.hyser@oracle.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-next.vger.kernel.org

--Sig_/8UbiCNBoq+7obPbjxZs63p2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in
arch/sparc/include/asm/topology_64.h between commit acc455cffa75
("sparc64: Setup sysfs to mark LDOM sockets, cores and threads
correctly") from the sparc tree and commit 06931e622468
("sched/topology: Rename topology_thread_cpumask() to
topology_sibling_cpumask()") from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/sparc/include/asm/topology_64.h
index d1761df5cca6,9a928fcb7a9b..000000000000
--- a/arch/sparc/include/asm/topology_64.h
+++ b/arch/sparc/include/asm/topology_64.h
@@@ -40,8 -40,8 +40,8 @@@ static inline int pcibus_to_node(struc
  #ifdef CONFIG_SMP
  #define topology_physical_package_id(cpu)	(cpu_data(cpu).proc_id)
  #define topology_core_id(cpu)			(cpu_data(cpu).core_id)
 -#define topology_core_cpumask(cpu)		(&cpu_core_map[cpu])
 +#define topology_core_cpumask(cpu)		(&cpu_core_sib_map[cpu])
- #define topology_thread_cpumask(cpu)		(&per_cpu(cpu_sibling_map, cpu))
+ #define topology_sibling_cpumask(cpu)		(&per_cpu(cpu_sibling_map, cpu))
  #endif /* CONFIG_SMP */
 =20
  extern cpumask_t cpu_core_map[NR_CPUS];

--Sig_/8UbiCNBoq+7obPbjxZs63p2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZrf7AAoJEMDTa8Ir7ZwVOvcQAI5yoe9KTkfdoYKABVdNwgnO
VxGGC0rfObpML/d0PHqdMoz5K5+3UcWT94v0rrdXEfBzHMkPOSTC1c7LmlP9yPrd
ecOuVZSwkCfX/tCiDLXdqaBOxUYJPS0MO24K862tDQRJEs/ZY2VH+91nDFzCYVsG
e4zubOAvhHVblUwEOJVU9aHiGFNZ8RuOMjarsOgSDLIbDNuxCChiWxXdybXoQaiq
X8Hq1CvOMDXIoJpTOAn07CjaX0Hg2vsu/8hPTwgg9c6YS9Ge/+PVUM0VMc0pNu4C
h7gWvD+L4zrY7RoNZEun4WROBcyMPKwVqm5o47L0qx48VUIH/kB/PXlX5HyiDUQp
Yi5vji8enmx2K7jTP9oaThREzFk/lZxt7XFQROXyIVWPoOLy3hq9PsJU6jiroKhm
vlVxBsC0wyXDLRbH+9ZmL47xfT140yKuWc3NBW9HLn0Zz9GCLb0dQlAfZIrK5F/S
WsDgXw+ovd7q7KBRCzxUFGRp4wDomIzriACd3lEbmhnsLN/g0w6AtaDzgfGnuyLo
C2jMtVnr8fJ5fdlDRkCqdJXuntdCodYF/u9PpNmwtXiiZSHMMYN7mSzXcVXOQNaO
u/PDHec8b67Bq2DuDftpjb8v11tCGLK3F8/dR8fPnU/39cZxxpvCK9JHa6mbvyy6
fl0pfAFEBjovQx6FbWfm
=XqL5
-----END PGP SIGNATURE-----

--Sig_/8UbiCNBoq+7obPbjxZs63p2--
