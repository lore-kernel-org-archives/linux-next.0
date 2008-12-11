From: James Smart <James.Smart@Emulex.Com>
Subject: Re: linux-next: scsi tree build warnings
Date: Thu, 11 Dec 2008 09:35:48 -0500
Message-ID: <49412544.8010104@emulex.com>
References: <20081211132503.bc5e5994.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from emulex.emulex.com ([138.239.112.1]:59060 "EHLO
	emulex.emulex.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755999AbYLKOeh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Dec 2008 09:34:37 -0500
In-Reply-To: <20081211132503.bc5e5994.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

we're cleaning this up now...

-- james s

Stephen Rothwell wrote:
> Hi James,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced these
> warnings:
> 
> drivers/scsi/lpfc/lpfc_scsi.c: In function 'lpfc_parse_bg_err':
> drivers/scsi/lpfc/lpfc_scsi.c:1319: warning: format '%llx' expects type 'long long unsigned int', but argument 3 has type 'sector_t'
> drivers/scsi/lpfc/lpfc_scsi.c: In function 'lpfc_queuecommand':
> drivers/scsi/lpfc/lpfc_scsi.c:2376: warning: format '%llu' expects type 'long long unsigned int', but argument 6 has type 'sector_t'
> drivers/scsi/lpfc/lpfc_scsi.c:2382: warning: format '%llu' expects type 'long long unsigned int', but argument 6 has type 'sector_t'
> drivers/scsi/lpfc/lpfc_scsi.c:2404: warning: format '%llu' expects type 'long long unsigned int', but argument 6 has type 'sector_t'
> drivers/scsi/lpfc/lpfc_scsi.c:2409: warning: format '%llu' expects type 'long long unsigned int', but argument 6 has type 'sector_t'
> drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_bg_guard_err_show':
> drivers/scsi/lpfc/lpfc_attr.c:126: warning: format '%llu' expects type 'long long unsigned int', but argument 4 has type 'uint64_t'
> drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_bg_apptag_err_show':
> drivers/scsi/lpfc/lpfc_attr.c:137: warning: format '%llu' expects type 'long long unsigned int', but argument 4 has type 'uint64_t'
> drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_bg_reftag_err_show':
> drivers/scsi/lpfc/lpfc_attr.c:148: warning: format '%llu' expects type 'long long unsigned int', but argument 4 has type 'uint64_t'
> 
> Introduced by commit 46c6a5eabb0284b10c0377bd78c04edcb4163ee0 ("[SCSI] lpfc 8.3.0 : Add BlockGuard support (T10-DIF) code").
> 
> I guess sector_t and uint64_t should be cast to "unsigned long long"
> for printing as u64 is "unsigned long" on some architectures and
> "unsigned long long" on others.
