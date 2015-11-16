From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the target-merge tree with the scsi
 tree
Date: Mon, 16 Nov 2015 13:03:23 +1100
Message-ID: <20151116130323.424af513@canb.auug.org.au>
References: <20151113120605.267e2627@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40340 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751393AbbKPCD0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 15 Nov 2015 21:03:26 -0500
In-Reply-To: <20151113120605.267e2627@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sreekanth Reddy <sreekanth.reddy@avagotech.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Calvin Owens <calvinowens@fb.com>

Hi Nicholas,

On Fri, 13 Nov 2015 12:06:05 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the target-merge tree got conflicts in
> several files.  It looks like a newer version of all the commits in the
> target-merge tree has been applied to the scsi tree, so I just dropped
> the target-merge tree for today.  You might like to tidy it up with
> respect to the current scsi tree.

In particular this series from the target-merge tree:

8edb1554f7c2 mpt3sas: Fix unprotected list lookup in v4.3-rc0 changes
db9e2f795915 mpt3sas: Refcount fw_events and fix unsafe list usage
9dab68af61d6 mpt3sas: Refcount sas_device objects and fix unsafe list usage
0f9b74e50d06 mpt2sas: Refcount fw_events and fix unsafe list usage
2757abdc85c1 mpt2sas: Refcount sas_device objects and fix unsafe list usage

conflicts with this series (now from Linus' tree):

abc01f7d54da mpt3sas: Bump mpt3sas driver version to 09.102.00.00
c84b06a48c4d mpt3sas: Single driver module which supports both SAS 2.0 & SAS 3.0 HBAs
d0c627afb7a6 mpt2sas, mpt3sas: Update the driver versions
08c4d550c579 mpt3sas: setpci reset kernel oops fix
989e43c7ec34 mpt3sas: Added OEM Gen2 PnP ID branding names
146b16c8071f mpt3sas: Refcount fw_events and fix unsafe list usage
d1cb5e495e53 mpt3sas: Refcount sas_device objects and fix unsafe list usage
422630955ea3 mpt3sas: sysfs attribute to report Backup Rail Monitor Status
7786ab6aff9c mpt3sas: Ported WarpDrive product SSS6200 support
16e179bda58f mpt3sas: fix for driver fails EEH, recovery from injected pci bus error
42081173c74e mpt3sas: Manage MSI-X vectors according to HBA device type
45506049c7ab mpt3sas: Don't send PHYDISK_HIDDEN RAID action request on SAS2 HBAs
471ef9d4e498 mpt3sas: Build MPI SGL LIST on GEN2 HBAs and IEEE SGL LIST on GEN3 HBAs
af0094115b08 mpt2sas, mpt3sas: Remove SCSI_MPTXSAS_LOGGING entry from Kconfig
d357e84d65df mpt3sas: Define 'hba_mpi_version_belonged' IOC variable
09ec55ed74eb mpt2sas: Remove .c and .h files from mpt2sas driver
78f97c8f612d mpt2sas: Move Gen2 HBA's device registration to a separate file
7497392a1193 mpt3sas: Move Gen3 HBA's device registration to a separate file
8a7e4c24e08f mpt3sas: Added mpt2sas driver definitions

So it would be nice if you could tidy up the target-merge tree.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
