From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [-next] cpu cache info in drivers base?
Date: Mon, 24 Nov 2014 16:00:48 +0100
Message-ID: <20141124150048.GD3738@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp13.uk.ibm.com ([195.75.94.109]:51191 "EHLO
	e06smtp13.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751069AbaKXPBP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 24 Nov 2014 10:01:15 -0500
Received: from /spool/local
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Mon, 24 Nov 2014 15:01:13 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 49F4917D8045
	for <linux-next@vger.kernel.org>; Mon, 24 Nov 2014 15:01:25 +0000 (GMT)
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com [9.149.37.213])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id sAOF1Ab82490650
	for <linux-next@vger.kernel.org>; Mon, 24 Nov 2014 15:01:10 GMT
Received: from d06av03.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id sAOF11L4001920
	for <linux-next@vger.kernel.org>; Mon, 24 Nov 2014 08:01:08 -0700
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-next@vger.kernel.org

Hi there,

I'm just wondering what the point of the current cpu cache info
within drivers/base is?
If I startup linux-next (as of today) all I get is an error message
"error detecting cacheinfo..cpu0".
Which naturally comes from:

int __weak init_cache_level(unsigned int cpu)
{
	return -ENOENT;
}

Given that there is no implementation without __weak I'm wondering
what the point is? Also it looks like no architecture has been
converted to the new infrastructure, even though such patches have
been posted in the past?
