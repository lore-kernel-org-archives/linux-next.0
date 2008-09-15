From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sparseirq tree
Date: Tue, 16 Sep 2008 01:19:04 +1000
Message-ID: <20080916011904.1e53d750.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__16_Sep_2008_01_19_04_+1000_qIWsLgBqX5Z=QFlU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36509 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753767AbYIOPTR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Sep 2008 11:19:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Markus Metzger <markus.t.metzger@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Roland McGrath <roland@redhat.com>

--Signature=_Tue__16_Sep_2008_01_19_04_+1000_qIWsLgBqX5Z=QFlU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Inog,

Today's linux-next merge of the sparseirq tree got a conflict in
arch/x86/kernel/ptrace.c between commit
393084e9e8c20c63cef574a6466ec0e59c711727 ("x86: ioperm user_regset") from
the x86 tree and commit 93fa7636dfdc059b25df148f230c0991096afdef ("x86,
ptrace: PEBS support") from the sparseirq tree.

Mostly overlapping additions/changes.  I fixed it up (see below) and can
carry the fix.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/ptrace.c
index 6b7ab0b,58ce4b5..0000000
--- a/arch/x86/kernel/ptrace.c
+++ b/arch/x86/kernel/ptrace.c
@@@ -557,41 -554,87 +557,110 @@@ static int ptrace_set_debugreg(struct t
  	return 0;
  }
 =20
 +/*
 + * These access the current or another (stopped) task's io permission
 + * bitmap for debugging or core dump.
 + */
 +static int ioperm_active(struct task_struct *target,
 +			 const struct user_regset *regset)
 +{
 +	return target->thread.io_bitmap_max / regset->size;
 +}
 +
 +static int ioperm_get(struct task_struct *target,
 +		      const struct user_regset *regset,
 +		      unsigned int pos, unsigned int count,
 +		      void *kbuf, void __user *ubuf)
 +{
 +	if (!target->thread.io_bitmap_ptr)
 +		return -ENXIO;
 +
 +	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
 +				   target->thread.io_bitmap_ptr,
 +				   0, IO_BITMAP_BYTES);
 +}
 +
- #ifdef X86_BTS
+ #ifdef CONFIG_X86_PTRACE_BTS
+ /*
+  * The configuration for a particular BTS hardware implementation.
+  */
+ struct bts_configuration {
+ 	/* the size of a BTS record in bytes; at most BTS_MAX_RECORD_SIZE */
+ 	unsigned char  sizeof_bts;
+ 	/* the size of a field in the BTS record in bytes */
+ 	unsigned char  sizeof_field;
+ 	/* a bitmask to enable/disable BTS in DEBUGCTL MSR */
+ 	unsigned long debugctl_mask;
+ };
+ static struct bts_configuration bts_cfg;
+=20
+ #define BTS_MAX_RECORD_SIZE (8 * 3)
+=20
+=20
+ /*
+  * Branch Trace Store (BTS) uses the following format. Different
+  * architectures vary in the size of those fields.
+  * - source linear address
+  * - destination linear address
+  * - flags
+  *
+  * Later architectures use 64bit pointers throughout, whereas earlier
+  * architectures use 32bit pointers in 32bit mode.
+  *
+  * We compute the base address for the first 8 fields based on:
+  * - the field size stored in the DS configuration
+  * - the relative field position
+  *
+  * In order to store additional information in the BTS buffer, we use
+  * a special source address to indicate that the record requires
+  * special interpretation.
+  *
+  * Netburst indicated via a bit in the flags field whether the branch
+  * was predicted; this is ignored.
+  */
 =20
- static int ptrace_bts_get_size(struct task_struct *child)
+ enum bts_field {
+ 	bts_from =3D 0,
+ 	bts_to,
+ 	bts_flags,
+=20
+ 	bts_escape =3D (unsigned long)-1,
+ 	bts_qual =3D bts_to,
+ 	bts_jiffies =3D bts_flags
+ };
+=20
+ static inline unsigned long bts_get(const char *base, enum bts_field fiel=
d)
  {
- 	if (!child->thread.ds_area_msr)
- 		return -ENXIO;
+ 	base +=3D (bts_cfg.sizeof_field * field);
+ 	return *(unsigned long *)base;
+ }
 =20
- 	return ds_get_bts_index((void *)child->thread.ds_area_msr);
+ static inline void bts_set(char *base, enum bts_field field, unsigned lon=
g val)
+ {
+ 	base +=3D (bts_cfg.sizeof_field * field);;
+ 	(*(unsigned long *)base) =3D val;
  }
 =20
- static int ptrace_bts_read_record(struct task_struct *child,
- 				  long index,
+ /*
+  * Translate a BTS record from the raw format into the bts_struct format
+  *
+  * out (out): bts_struct interpretation
+  * raw: raw BTS record
+  */
+ static void ptrace_bts_translate_record(struct bts_struct *out, const voi=
d *raw)
+ {
+ 	memset(out, 0, sizeof(*out));
+ 	if (bts_get(raw, bts_from) =3D=3D bts_escape) {
+ 		out->qualifier       =3D bts_get(raw, bts_qual);
+ 		out->variant.jiffies =3D bts_get(raw, bts_jiffies);
+ 	} else {
+ 		out->qualifier =3D BTS_BRANCH;
+ 		out->variant.lbr.from_ip =3D bts_get(raw, bts_from);
+ 		out->variant.lbr.to_ip   =3D bts_get(raw, bts_to);
+ 	}
+ }
+=20
+ static int ptrace_bts_read_record(struct task_struct *child, size_t index,
  				  struct bts_struct __user *out)
  {
  	struct bts_struct ret;

--Signature=_Tue__16_Sep_2008_01_19_04_+1000_qIWsLgBqX5Z=QFlU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjOfOgACgkQjjKRsyhoI8znCQCgp2rHKcQWWxNnoo3dRbWAdGcd
V8sAn3uG3w27kV9ZRvqYFCA5QEWXBN6z
=vDQX
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Sep_2008_01_19_04_+1000_qIWsLgBqX5Z=QFlU--
