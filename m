From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tile
 tree
Date: Tue, 7 Apr 2015 21:05:41 +1000
Message-ID: <20150407210541.04f42153@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sF0juSoRlrIe+1b1r2BmAN8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Chris Metcalf <cmetcalf@ezchip.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ulrich Obergfell <uobergfe@redhat.com>, Don Zickus <dzickus@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/sF0juSoRlrIe+1b1r2BmAN8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
include/linux/nmi.h between commit e164ade07b21 ("watchdog: add
watchdog_exclude sysctl to assist nohz") from the tile tree and commit
866d62a433cc ("watchdog: enable the new user interface of the watchdog
mechanism") from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/nmi.h
index 1703829c5812,3d46fb4708e0..000000000000
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@@ -68,15 -63,20 +63,23 @@@ static inline bool trigger_allbutself_c
  #ifdef CONFIG_LOCKUP_DETECTOR
  int hw_nmi_is_cpu_stuck(struct pt_regs *);
  u64 hw_nmi_get_sample_period(int watchdog_thresh);
+ extern int nmi_watchdog_enabled;
+ extern int soft_watchdog_enabled;
  extern int watchdog_user_enabled;
  extern int watchdog_thresh;
 +extern unsigned long *watchdog_exclude_mask_bits;
  extern int sysctl_softlockup_all_cpu_backtrace;
  struct ctl_table;
- extern int proc_dowatchdog(struct ctl_table *, int ,
- 			   void __user *, size_t *, loff_t *);
+ extern int proc_watchdog(struct ctl_table *, int ,
+ 			 void __user *, size_t *, loff_t *);
+ extern int proc_nmi_watchdog(struct ctl_table *, int ,
+ 			     void __user *, size_t *, loff_t *);
+ extern int proc_soft_watchdog(struct ctl_table *, int ,
+ 			      void __user *, size_t *, loff_t *);
+ extern int proc_watchdog_thresh(struct ctl_table *, int ,
+ 				void __user *, size_t *, loff_t *);
 +extern int proc_dowatchdog_exclude(struct ctl_table *, int,
 +				   void __user *, size_t *, loff_t *);
  #endif
 =20
  #ifdef CONFIG_HAVE_ACPI_APEI_NMI

--Sig_/sF0juSoRlrIe+1b1r2BmAN8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVI7oLAAoJEMDTa8Ir7ZwV1pcP/2mj+K4qT8jjvbxb9RAKP9qv
D0sOUHn6kcf98KmaBoAIKlATKmo6u3GOFl5IRopJ7/wlDwQ+6Qw6d/dbHIxLPOau
2QaPW0HRICXeuMQhR4P5wkcUat1ZMFJccJUmjyDufUwc1UOovy5o8zmc0MezD7TM
V1jyNYA0KTUen8Pt9FwxNtLyxW5iDI85LHrtGI7wvrzQho+Rbhh4iG6JK9hF0e2r
r9ZhTYayf01TazschPZiuxWPVKELVezuhqq6l2LZKmkWtIm/uD/80tEwV1hAuS9/
3eaIaKtS2+Cl++788AGUG2DcX1qRMZnI0efG2RWD3+BxF3Yp3hDeua1GV4ziqUVs
c77B62Bktxz9TkgOXkIgXnF/kHR3U6J03GjPvu4pYHbbDIKzk2Yvpq7n61BjxERJ
Ii4Hs5RSrr3zmljSAPbv5raVQ31A3eRet1BPp8/ycKcaClAzE/55w0Ds/O0rrtNM
nR/SFMDXdD8FU0pKKD7RVf+T2KsidL/Dj/QA0/r7b8Z902xyqDOhIxr/Hgp5oYrC
TJP9d7HjB3eCLQr1hXq1eZmOthJ1S2vPH7gEXTGZMjHkln/UqfHecqVCB3Dbc5lv
oe9P0m5PjnuDLxsTxaTBVLoaE8wtOl4Qtu8ztewGEq/m4yMb62RsAFoQmttO61Vp
c9DrmEY4AEwejixqsY0p
=WJp3
-----END PGP SIGNATURE-----

--Sig_/sF0juSoRlrIe+1b1r2BmAN8--
