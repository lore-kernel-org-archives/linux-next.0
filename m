From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with Linus' tree
Date: Mon, 28 Nov 2011 14:13:39 +0900
Message-ID: <20111128051339.GA9709@kroah.com>
References: <20111128151857.d4ce49d38ed4983f8ba4d68e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:56980 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751430Ab1K1FQb (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Nov 2011 00:16:31 -0500
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 532C521301
	for <linux-next@vger.kernel.org>; Mon, 28 Nov 2011 00:16:31 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20111128151857.d4ce49d38ed4983f8ba4d68e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Whitcroft <apw@canonical.com>

On Mon, Nov 28, 2011 at 03:18:57PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/iio/industrialio-core.c between commit aaa0b4f00729
> ("iio: iio_event_getfd -- fix ev_int build failure") from Linus' tree and
> commit f791cec85073 ("Subject: fix build breakage in
> drivers/staging/iio/industrialio-core.c") from the staging tree.
> 
> The former was a more extensive fix (and is upstream), so I used that.

Yes, that's fine, I'll handle the merge when 3.2-rc4 is out, thanks.

greg k-h
