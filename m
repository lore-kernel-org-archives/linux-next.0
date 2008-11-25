From: "Serge E. Hallyn" <serue@us.ibm.com>
Subject: userns tree ready
Date: Mon, 24 Nov 2008 18:16:51 -0600
Message-ID: <20081125001651.GA10661@us.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e33.co.us.ibm.com ([32.97.110.151]:41729 "EHLO
	e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753309AbYKYAQx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 Nov 2008 19:16:53 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com [9.17.195.106])
	by e33.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id mAP0GLYV011421
	for <linux-next@vger.kernel.org>; Mon, 24 Nov 2008 17:16:21 -0700
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mAP0GrsW090522
	for <linux-next@vger.kernel.org>; Mon, 24 Nov 2008 17:16:53 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mAP0Gq0b004528
	for <linux-next@vger.kernel.org>; Mon, 24 Nov 2008 17:16:52 -0700
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Howells <dhowells@redhat.com>, linux-next@vger.kernel.org

Hi Stephen,

I've created a new userns tree - although the patches are completely
unchanged from before they were pulled along with David's patches.
They apply fine either right after James' security-next tree or at
the end of linux-next.  The tree is at

git://git.kernel.org/pub/scm/linux/kernel/git/sergeh/userns-2.6#next

like before, and is based on James's security-next tree.

thanks,
-serge
