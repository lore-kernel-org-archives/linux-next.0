From: "Williams, Dan J" <dan.j.williams@intel.com>
Subject: Re: linux-next: build failure after merge of the isci tree
Date: Fri, 23 Mar 2012 10:08:32 -0700
Message-ID: <CABE8wwtBLGezYYi65_ZkrCZbt2f_t3LmvyCv3QLDGtTg4c3sJA@mail.gmail.com>
References: <20120323132646.9e258a9cf41be00e8a839065@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga10.intel.com ([192.55.52.92]:64323 "EHLO
	fmsmga102.fm.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755513Ab2CWRId (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 Mar 2012 13:08:33 -0400
Received: by yhpp61 with SMTP id p61so5017615yhp.25
        for <linux-next@vger.kernel.org>; Fri, 23 Mar 2012 10:08:32 -0700 (PDT)
In-Reply-To: <20120323132646.9e258a9cf41be00e8a839065@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 22, 2012 at 7:26 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Dan,
>
> After merging the isci tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> drivers/scsi/ipr.c: In function 'ipr_ata_slave_alloc':
> drivers/scsi/ipr.c:4552:28: error: 'ap' undeclared (first use in this function)
>
> Caused by commit 837f52ee7a86 ("libsas, libata: fix start of life for a
> sas ata_port").
>
> I have used the isci tree from next-20120322 for today.

/me kicks himself for overlooking CONFIG_IPR=n in his .config

Fixed up and pushed out.

--
Dan
