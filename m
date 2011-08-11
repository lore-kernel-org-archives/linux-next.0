From: James Morris <jmorris@namei.org>
Subject: Re: [PATCH 2/2] evm: fix evm_inode_init_security return code
Date: Thu, 11 Aug 2011 18:13:54 +1000 (EST)
Message-ID: <alpine.LRH.2.00.1108111813330.5490@tundra.namei.org>
References: <1313036572-27122-1-git-send-email-zohar@linux.vnet.ibm.com> <1313036572-27122-2-git-send-email-zohar@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:48421 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752025Ab1HKIOB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Aug 2011 04:14:01 -0400
In-Reply-To: <1313036572-27122-2-git-send-email-zohar@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, David Safford <safford@watson.ibm.com>, Mimi Zohar <zohar@us.ibm.com>

Both applied, still seeing this problem:

http://marc.info/?l=linux-kernel&m=131293882430148&w=2



-- 
James Morris
<jmorris@namei.org>
