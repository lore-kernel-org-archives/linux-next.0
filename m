From: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Subject: Re: linux-next: manual merge of the tests tree
Date: Tue, 17 Jun 2008 11:57:16 +0530
Message-ID: <20080617062716.GB8300@in.ibm.com>
References: <20080617162256.4a17529b.sfr@canb.auug.org.au>
Reply-To: ananth@in.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:57554 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752147AbYFQG2O (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Jun 2008 02:28:14 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com [9.17.195.227])
	by e35.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m5H6SDwF011593
	for <linux-next@vger.kernel.org>; Tue, 17 Jun 2008 02:28:13 -0400
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m5H6SDd1135566
	for <linux-next@vger.kernel.org>; Tue, 17 Jun 2008 00:28:13 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m5H6SDj7032618
	for <linux-next@vger.kernel.org>; Tue, 17 Jun 2008 00:28:13 -0600
Content-Disposition: inline
In-Reply-To: <20080617162256.4a17529b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

On Tue, Jun 17, 2008 at 04:22:56PM +1000, Stephen Rothwell wrote:
> Hi Ananth,
> 
> Today's linux-next merge of the tests tree got a new conflict in
> lib/Kconfig.debug between commit 1462a200057df08be12f3719e1f37adbd2c6e4d0
> ("Revert "prohibit rcutorture from being compiled into the kernel"") from
> the sched tree and commit db00d6090740863199393461c8332812986ce4ad ("Move
> rcutorture to tests/").
> 
> It is trivial and I did the obvious fixup and will carry that.

Thank you Stephen!

Ananth
