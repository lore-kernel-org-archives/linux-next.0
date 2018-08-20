From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Mon, 20 Aug 2018 14:32:22 +1000
Message-ID: <20180820143222.5aaa69d9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/s4G8p8iUlEwvQ0HHM_IOcq0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, James Morse <james.morse@arm.com>, Omar Sandoval <osandov@fb.com>
List-Id: linux-next.vger.kernel.org

--Sig_/s4G8p8iUlEwvQ0HHM_IOcq0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got conflicts in:

  fs/proc/kcore.c
  include/linux/kcore.h

between commit:

  6855dc41b246 ("x86: Add entry trampolines to kcore")

from the tip tree and commits:

  4eb27c275abf ("fs/proc/kcore.c: use __pa_symbol() for KCORE_TEXT list ent=
ries")
  ea551910d3f4 ("proc/kcore: clean up ELF header generation")
  537412a2958f ("proc/kcore: don't grab lock for kclist_add()")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/proc/kcore.c
index 00282f134336,80464432dfe6..000000000000
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@@ -448,53 -291,148 +291,151 @@@ static ssize_
  read_kcore(struct file *file, char __user *buffer, size_t buflen, loff_t =
*fpos)
  {
  	char *buf =3D file->private_data;
- 	ssize_t acc =3D 0;
- 	size_t size, tsz;
- 	size_t elf_buflen;
+ 	size_t phdrs_offset, notes_offset, data_offset;
+ 	size_t phdrs_len, notes_len;
+ 	struct kcore_list *m;
+ 	size_t tsz;
  	int nphdr;
  	unsigned long start;
+ 	size_t orig_buflen =3D buflen;
+ 	int ret =3D 0;
 =20
- 	read_lock(&kclist_lock);
- 	size =3D get_kcore_size(&nphdr, &elf_buflen);
+ 	down_read(&kclist_lock);
+=20
+ 	get_kcore_size(&nphdr, &phdrs_len, &notes_len, &data_offset);
+ 	phdrs_offset =3D sizeof(struct elfhdr);
+ 	notes_offset =3D phdrs_offset + phdrs_len;
+=20
+ 	/* ELF file header. */
+ 	if (buflen && *fpos < sizeof(struct elfhdr)) {
+ 		struct elfhdr ehdr =3D {
+ 			.e_ident =3D {
+ 				[EI_MAG0] =3D ELFMAG0,
+ 				[EI_MAG1] =3D ELFMAG1,
+ 				[EI_MAG2] =3D ELFMAG2,
+ 				[EI_MAG3] =3D ELFMAG3,
+ 				[EI_CLASS] =3D ELF_CLASS,
+ 				[EI_DATA] =3D ELF_DATA,
+ 				[EI_VERSION] =3D EV_CURRENT,
+ 				[EI_OSABI] =3D ELF_OSABI,
+ 			},
+ 			.e_type =3D ET_CORE,
+ 			.e_machine =3D ELF_ARCH,
+ 			.e_version =3D EV_CURRENT,
+ 			.e_phoff =3D sizeof(struct elfhdr),
+ 			.e_flags =3D ELF_CORE_EFLAGS,
+ 			.e_ehsize =3D sizeof(struct elfhdr),
+ 			.e_phentsize =3D sizeof(struct elf_phdr),
+ 			.e_phnum =3D nphdr,
+ 		};
+=20
+ 		tsz =3D min_t(size_t, buflen, sizeof(struct elfhdr) - *fpos);
+ 		if (copy_to_user(buffer, (char *)&ehdr + *fpos, tsz)) {
+ 			ret =3D -EFAULT;
+ 			goto out;
+ 		}
 =20
- 	if (buflen =3D=3D 0 || *fpos >=3D size) {
- 		read_unlock(&kclist_lock);
- 		return 0;
+ 		buffer +=3D tsz;
+ 		buflen -=3D tsz;
+ 		*fpos +=3D tsz;
  	}
 =20
- 	/* trim buflen to not go beyond EOF */
- 	if (buflen > size - *fpos)
- 		buflen =3D size - *fpos;
-=20
- 	/* construct an ELF core header if we'll need some of it */
- 	if (*fpos < elf_buflen) {
- 		char * elf_buf;
-=20
- 		tsz =3D elf_buflen - *fpos;
- 		if (buflen < tsz)
- 			tsz =3D buflen;
- 		elf_buf =3D kzalloc(elf_buflen, GFP_ATOMIC);
- 		if (!elf_buf) {
- 			read_unlock(&kclist_lock);
- 			return -ENOMEM;
+ 	/* ELF program headers. */
+ 	if (buflen && *fpos < phdrs_offset + phdrs_len) {
+ 		struct elf_phdr *phdrs, *phdr;
+=20
+ 		phdrs =3D kzalloc(phdrs_len, GFP_KERNEL);
+ 		if (!phdrs) {
+ 			ret =3D -ENOMEM;
+ 			goto out;
  		}
- 		elf_kcore_store_hdr(elf_buf, nphdr, elf_buflen);
- 		read_unlock(&kclist_lock);
- 		if (copy_to_user(buffer, elf_buf + *fpos, tsz)) {
- 			kfree(elf_buf);
- 			return -EFAULT;
+=20
+ 		phdrs[0].p_type =3D PT_NOTE;
+ 		phdrs[0].p_offset =3D notes_offset;
+ 		phdrs[0].p_filesz =3D notes_len;
+=20
+ 		phdr =3D &phdrs[1];
+ 		list_for_each_entry(m, &kclist_head, list) {
+ 			phdr->p_type =3D PT_LOAD;
+ 			phdr->p_flags =3D PF_R | PF_W | PF_X;
+ 			phdr->p_offset =3D kc_vaddr_to_offset(m->addr) + data_offset;
 -			phdr->p_vaddr =3D (size_t)m->addr;
 -			if (m->type =3D=3D KCORE_RAM)
++			if (m->type =3D=3D KCORE_REMAP)
++				phdr->p_vaddr	=3D (size_t)m->vaddr;
++			else
++				phdr->p_vaddr	=3D (size_t)m->addr;
++			if (m->type =3D=3D KCORE_RAM || m->type =3D=3D KCORE_REMAP)
+ 				phdr->p_paddr =3D __pa(m->addr);
+ 			else if (m->type =3D=3D KCORE_TEXT)
+ 				phdr->p_paddr =3D __pa_symbol(m->addr);
+ 			else
+ 				phdr->p_paddr =3D (elf_addr_t)-1;
+ 			phdr->p_filesz =3D phdr->p_memsz =3D m->size;
+ 			phdr->p_align =3D PAGE_SIZE;
+ 			phdr++;
  		}
- 		kfree(elf_buf);
+=20
+ 		tsz =3D min_t(size_t, buflen, phdrs_offset + phdrs_len - *fpos);
+ 		if (copy_to_user(buffer, (char *)phdrs + *fpos - phdrs_offset,
+ 				 tsz)) {
+ 			kfree(phdrs);
+ 			ret =3D -EFAULT;
+ 			goto out;
+ 		}
+ 		kfree(phdrs);
+=20
+ 		buffer +=3D tsz;
  		buflen -=3D tsz;
  		*fpos +=3D tsz;
- 		buffer +=3D tsz;
- 		acc +=3D tsz;
+ 	}
+=20
+ 	/* ELF note segment. */
+ 	if (buflen && *fpos < notes_offset + notes_len) {
+ 		struct elf_prstatus prstatus =3D {};
+ 		struct elf_prpsinfo prpsinfo =3D {
+ 			.pr_sname =3D 'R',
+ 			.pr_fname =3D "vmlinux",
+ 		};
+ 		char *notes;
+ 		size_t i =3D 0;
+=20
+ 		strlcpy(prpsinfo.pr_psargs, saved_command_line,
+ 			sizeof(prpsinfo.pr_psargs));
+=20
+ 		notes =3D kzalloc(notes_len, GFP_KERNEL);
+ 		if (!notes) {
+ 			ret =3D -ENOMEM;
+ 			goto out;
+ 		}
+=20
+ 		append_kcore_note(notes, &i, CORE_STR, NT_PRSTATUS, &prstatus,
+ 				  sizeof(prstatus));
+ 		append_kcore_note(notes, &i, CORE_STR, NT_PRPSINFO, &prpsinfo,
+ 				  sizeof(prpsinfo));
+ 		append_kcore_note(notes, &i, CORE_STR, NT_TASKSTRUCT, current,
+ 				  arch_task_struct_size);
+ 		/*
+ 		 * vmcoreinfo_size is mostly constant after init time, but it
+ 		 * can be changed by crash_save_vmcoreinfo(). Racing here with a
+ 		 * panic on another CPU before the machine goes down is insanely
+ 		 * unlikely, but it's better to not leave potential buffer
+ 		 * overflows lying around, regardless.
+ 		 */
+ 		append_kcore_note(notes, &i, VMCOREINFO_NOTE_NAME, 0,
+ 				  vmcoreinfo_data,
+ 				  min(vmcoreinfo_size, notes_len - i));
+=20
+ 		tsz =3D min_t(size_t, buflen, notes_offset + notes_len - *fpos);
+ 		if (copy_to_user(buffer, notes + *fpos - notes_offset, tsz)) {
+ 			kfree(notes);
+ 			ret =3D -EFAULT;
+ 			goto out;
+ 		}
+ 		kfree(notes);
 =20
- 		/* leave now if filled buffer already */
- 		if (buflen =3D=3D 0)
- 			return acc;
- 	} else
- 		read_unlock(&kclist_lock);
+ 		buffer +=3D tsz;
+ 		buflen -=3D tsz;
+ 		*fpos +=3D tsz;
+ 	}
 =20
  	/*
  	 * Check to see if our file offset matches with any of
diff --cc include/linux/kcore.h
index bc088ef96358,c20f296438fb..000000000000
--- a/include/linux/kcore.h
+++ b/include/linux/kcore.h
@@@ -37,13 -35,7 +37,13 @@@ struct vmcoredd_node=20
  };
 =20
  #ifdef CONFIG_PROC_KCORE
- extern void kclist_add(struct kcore_list *, void *, size_t, int type);
+ void __init kclist_add(struct kcore_list *, void *, size_t, int type);
 +static inline
 +void kclist_add_remap(struct kcore_list *m, void *addr, void *vaddr, size=
_t sz)
 +{
 +	m->vaddr =3D (unsigned long)vaddr;
 +	kclist_add(m, addr, sz, KCORE_REMAP);
 +}
  #else
  static inline
  void kclist_add(struct kcore_list *new, void *addr, size_t size, int type)

--Sig_/s4G8p8iUlEwvQ0HHM_IOcq0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt6RFYACgkQAVBC80lX
0Gy7cQf7BDjKUVtln4PXDrjFBxbR9S9K4w77QWYMZj7TkBiIsjVxGXHfPwaUkzeH
57XOG/XO4jg0JPSkS9Y3iutqL5n6PMsC0/8DkRPOC4Ggwt78x+3ctouv6cd29qdv
hSSNpAyht5EykM890WrphIZo88LajvU8p7ekddKNylx326htMdOfJ3zT57c4smu3
4KAADsPFXBchhIlMZ57wBm5ykGbODXMB7PV0pXXTorBCO0/E+RIijKVEiJjELGGO
HvRQpguFEODmtfxSxnOBX5LKgDtPFBu6jz1CBMuKz0eO9Jt81OgabvHBKK2q/xvD
Em+gschNVqPYIGnUQdo1adwqY2Pb1w==
=c1gK
-----END PGP SIGNATURE-----

--Sig_/s4G8p8iUlEwvQ0HHM_IOcq0--
