From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Crash in -next due to 'drivers/of: Fix depth when unflattening
 devicetree'
Date: Wed, 18 May 2016 21:00:24 -0700
Message-ID: <20160519040024.GA7092@roeck-us.net>
References: <20160519031112.GA12007@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53350 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750723AbcESEAW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 May 2016 00:00:22 -0400
Content-Disposition: inline
In-Reply-To: <20160519031112.GA12007@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rhyland Klein <rklein@nvidia.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>

On Wed, May 18, 2016 at 08:11:12PM -0700, Guenter Roeck wrote:
> Hi,
> 
> some of my ppc qemu tests crash with the following log message.
> 
> VFS: Cannot open root device "hda" or unknown-block(0,0): error -6
> Please append a correct "root=" boot option; here are the available partitions:
> 0100            4096 ram0  (driver?)
> 0101            4096 ram1  (driver?)
> 0102            4096 ram2  (driver?)
> 0103            4096 ram3  (driver?)
> 0104            4096 ram4  (driver?)
> 0105            4096 ram5  (driver?)
> 0106            4096 ram6  (driver?)
> 0107            4096 ram7  (driver?)
> 0108            4096 ram8  (driver?)
> 0109            4096 ram9  (driver?)
> 010a            4096 ram10  (driver?)
> 010b            4096 ram11  (driver?)
> 010c            4096 ram12  (driver?)
> 010d            4096 ram13  (driver?)
> 010e            4096 ram14  (driver?)
> 010f            4096 ram15  (driver?)
> 1600            8383 hdc  driver: ide-gd
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> 
> A complete boot log is available at
> http://kerneltests.org/builders/qemu-ppc-next/builds/408/steps/qemubuildcommand/logs/stdio
> 
> Bisect points to commit 'drivers/of: Fix depth when unflattening devicetree'.
> Reverting this commit fixes the problem. Bisect log is attached.
> 
> The scripts and root file system used for the test are available at
> https://github.com/groeck/linux-build-test/tree/master/rootfs/ppc
> 
> Failing tests are 
> 
> powerpc:mac99:nosmp:ppc_book3s_defconfig
> powerpc:g3beige:nosmp:ppc_book3s_defconfig
> powerpc:mac99:smp:ppc_book3s_defconfig
> 
Turns out this list of failed tests is incomplete. Also failing due to
the same commit, and passing after the commit was reverted:

arm:versatilepb-scsi:versatile_defconfig:versatile-pb
arm:versatilepb:versatile_defconfig:versatile-pb
arm:overo:multi_v7_defconfig:omap3-overo-tobi
arm:overo:omap2plus_defconfig:omap3-overo-tobi
arm:integratorcp:integrator_defconfig:integratorcp

Log with failures is at
http://kerneltests.org/builders/qemu-arm-next/builds/444/steps/qemubuildcommand/logs/stdio

Guenter

> Guenter
> 
> ---
> # bad: [1af872fb6cfb3c701d8819466a4672f85c3f17a3] dcssblk: fix the direct_access prototype to add 'size'
> # good: [2dcd0af568b0cf583645c8a317dd12e344b1c72a] Linux 4.6
> git bisect start 'HEAD' 'v4.6'
> # good: [586cf328ff7e7c0c32f89d6f2063c81143802c01] Merge remote-tracking branch 'net-next/master'
> git bisect good 586cf328ff7e7c0c32f89d6f2063c81143802c01
> # bad: [69bf2b19c358d937a3f40c07a08bc73476d43c02] Merge remote-tracking branch 'tty/tty-next'
> git bisect bad 69bf2b19c358d937a3f40c07a08bc73476d43c02
> # good: [c81e18989b12bdb70a056b05b94620eefd2aed7b] Merge remote-tracking branch 'drm/drm-next'
> git bisect good c81e18989b12bdb70a056b05b94620eefd2aed7b
> # good: [4668e9adc5722b6fdf887d0bc70e9f5998507689] Merge remote-tracking branch 'vfio/next'
> git bisect good 4668e9adc5722b6fdf887d0bc70e9f5998507689
> # bad: [8ab5e17d29971673f08ce9cabfa6170e2f56fe07] Merge remote-tracking branch 'ftrace/for-next'
> git bisect bad 8ab5e17d29971673f08ce9cabfa6170e2f56fe07
> # bad: [a792d9ada26755882a5ea1e958bc582fe6f2d7bc] Merge remote-tracking branch 'dt-rh/for-next'
> git bisect bad a792d9ada26755882a5ea1e958bc582fe6f2d7bc
> # good: [03da37387a3aa07e45d077043f48e7dc29206b62] Merge remote-tracking branch 'trivial/for-next'
> git bisect good 03da37387a3aa07e45d077043f48e7dc29206b62
> # good: [8f97c2814b5448d91a3c67081f7d978c097feabe] Documentation: dt: interrupt-controller: fix spelling mistakes
> git bisect good 8f97c2814b5448d91a3c67081f7d978c097feabe
> # good: [947c82cbf01c9c6012cb96e385b5f6d6d1e1decb] drivers/of: Rename unflatten_dt_node()
> git bisect good 947c82cbf01c9c6012cb96e385b5f6d6d1e1decb
> # bad: [047eb65024c00807ff8f0407580f088b23cf908e] of/unittest: Remove unnecessary module.h header inclusion
> git bisect bad 047eb65024c00807ff8f0407580f088b23cf908e
> # good: [bb91f923d176578257aed682047653cc33148413] drivers/of: Export of_detach_node()
> git bisect good bb91f923d176578257aed682047653cc33148413
> # bad: [ac78f9bdcf3836cafcd114a76a9473380a3faef5] drivers/of: Fix depth when unflattening devicetree
> git bisect bad ac78f9bdcf3836cafcd114a76a9473380a3faef5
> # good: [b9c43856f21d97ffdfdd642acf2eb0b52d3b1555] of: dynamic: changeset prop-update revert fix
> git bisect good b9c43856f21d97ffdfdd642acf2eb0b52d3b1555
> # first bad commit: [ac78f9bdcf3836cafcd114a76a9473380a3faef5] drivers/of: Fix depth when unflattening devicetree
