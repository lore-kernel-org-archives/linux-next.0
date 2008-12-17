From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  rr series import failure
Date: Thu, 18 Dec 2008 10:50:19 +1100
Message-ID: <20081218105019.6f564a38.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__18_Dec_2008_10_50_19_+1100_TwFbgxMhCklpvr_p"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50969 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751771AbYLQXud (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Dec 2008 18:50:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__18_Dec_2008_10_50_19_+1100_TwFbgxMhCklpvr_p
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next import of the rr quilt series failed like this:

Importing rr based on rr_cpumask/master
$ git checkout quilt/rr
Switched to branch "quilt/rr"
$ git reset --hard 7be7585393d311866653564fbcd10a3232773c0b
HEAD is now at 7be7585 cpumask: Use all NR_CPUS bits unless CONFIG_CPUMASK_=
OFFSTACK
$ git quiltimport --author Rusty Russell <rusty@rustcorp.com.au> --patches =
../quilt/rr
cpumask:smp_call_function_many-up-fix.patch
virtio:pci_queue_allocation_not_page_aligned.patch
virtio:struct_device_replace_bus_id_with_dev_name_dev_set_name.patch
virtio:VIRTIO_PCI_QUEUE_ADDR_SHIFT.patch
virtio:rename-vring-pagesize-to-align.patch
virtio:VIRTIO_PCI_VRING_ALIGN.patch
virtio:LGUEST_VRING_ALIGN.patch
virtio:KVM_S390_VIRTIO_RING_ALIGN.patch
virtio:virtqueue-hand-in-vqalign.patch
virtio:balloon_avoid_Linux_page_size.patch
virtio:block-no-max-segment-size-by-default.patch
virtio:block-dynamic-max-segments.patch
virtio:blk_fix_type_warning.patch
virtio:net_large_tx_mtu_support.patch
virtio:console_support_console_resizing.patch
virtio:kvm_s390_implement_config_changed_for_on_s390.patch
/home/sfr/kernels/next/next/.git/rebase-apply/patch:19: space before tab in=
 indent.
 	subcode =3D S390_lowcore.cpu_addr;
warning: 1 line adds whitespace errors.
lguest:move_the_initial_guest_page_table_creation_code_to_the_host.patch
module:remove_config_kmod.patch
Context reduced to (2/2) to apply fragment at 909
module:compare-sym-values-for-export-mark-in-proc-kallsyms.patch
module:print_unload_info-no-proc.patch
bitmap:test-for-constant.patch
6cc88bc4.patch
cpumask:for_each_cpu-in-cpumask.h.patch
cpumask:cpu_online_mask-etc-as-primary.patch
cpumask:convert-cpumask.h.patch
cpumask:out-of-line-accessors.patch
cpumask:add_sysfs_displays_for_configured_and_disabled_cpu_maps.patch
error: patch failed: arch/x86/kernel/smpboot.c:1293
error: arch/x86/kernel/smpboot.c: patch does not apply

So I have dropped it for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__18_Dec_2008_10_50_19_+1100_TwFbgxMhCklpvr_p
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklJkDsACgkQjjKRsyhoI8y6BACfTZ9k4yORNdqJpzMblkmxM/cR
gLMAn0NQZ2kUaTXi0LG8Z+6/iPyuypks
=CctC
-----END PGP SIGNATURE-----

--Signature=_Thu__18_Dec_2008_10_50_19_+1100_TwFbgxMhCklpvr_p--
