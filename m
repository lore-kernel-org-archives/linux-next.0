From: Haiyang Zhang <haiyangz@microsoft.com>
Subject: RE: linux-next: manual merge of the kmap_atomic tree with the
 staging tree
Date: Fri, 6 Jan 2012 15:47:31 +0000
Message-ID: <A1F3067C9B68744AA19F6802BAB8FFDC0CD04FEB@TK5EX14MBXC222.redmond.corp.microsoft.com>
References: <20120106184055.3669727def69e424cd98690d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]:22191
	"EHLO DB3EHSOBE003.bigfish.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1030320Ab2AFPrl convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Jan 2012 10:47:41 -0500
In-Reply-To: <20120106184055.3669727def69e424cd98690d@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Cong Wang <amwang@redhat.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, KY Srinivasan <kys@microsoft.com>, Greg KH <greg@kroah.com>



> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Friday, January 06, 2012 2:41 AM
> To: Cong Wang
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Haiyang Zhang;
> KY Srinivasan; Greg KH
> Subject: linux-next: manual merge of the kmap_atomic tree with the staging
> tree
> 
> Hi Cong,
> 
> Today's linux-next merge of the kmap_atomic tree got conflicts in
> drivers/net/hyperv/netvsc_drv.c and drivers/net/hyperv/rndis_filter.c between
> commit 453263421f88 ("net/hyperv: Remove unnecessary kmap_atomic in
> netvsc driver") from the staging tree and commit e91cd643d15d ("hv:
> remove the second argument of k[un]map_atomic()") from the kmap_atomic
> tree.
> 
> The former removed the code modified by the latter, so I did that.

Good! Thank you for the merging.

- Haiyang
