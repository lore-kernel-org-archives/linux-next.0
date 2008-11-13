From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 13 (auditsc)
Date: Thu, 13 Nov 2008 09:55:01 -0800
Message-ID: <20081113095501.7d91cd91.randy.dunlap@oracle.com>
References: <20081113183316.3601c13d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:56850 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751557AbYKMRzQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Nov 2008 12:55:16 -0500
In-Reply-To: <20081113183316.3601c13d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 13 Nov 2008 18:33:16 +1100 Stephen Rothwell wrote:


auditsc build fails when
CONFIG_KEYS=y
CONFIG_KEYS_DEBUG_PROC_KEYS=y
CONFIG_SECURITY=y
# CONFIG_SECURITYFS is not set
# CONFIG_SECURITY_NETWORK is not set
# CONFIG_SECURITY_FILE_CAPABILITIES is not set

error is:
auditsc.c:(.text+0x2afaf): undefined reference to `get_vfs_caps_from_disk'

---
~Randy-r5905
