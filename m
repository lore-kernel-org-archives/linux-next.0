From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: input tree build failure
Date: Mon, 07 Dec 2009 08:25:36 -0800
Message-ID: <4B1D2C80.4060202@oracle.com>
References: <20091207200344.01323cb5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:34558 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933781AbZLGQ04 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2009 11:26:56 -0500
In-Reply-To: <20091207200344.01323cb5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell wrote:
> Hi Dmitry,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> drivers/input/sparse-keymap.c:101: error: __ksymtab_sparse_keymap_setkeycode causes a section type conflict
> 
> Caused by commit a2dd9f7ceeb28f495587834aa5778c721611d61b ("Input: add
> generic support for sparse keymaps").
> 
> static functions should not given to EXPORT_SYMBOL().
> 
> I have reverted that commit for today.

(DT:) Is that what causes wistron_btns builds to fail also?

-- 
~Randy
