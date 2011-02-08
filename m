From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
Date: Tue, 8 Feb 2011 03:50:26 +0000
Message-ID: <20110208035026.GA32658@srcf.ucam.org>
References: <20110208144522.ecea74db.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:45185 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751106Ab1BHDui (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Feb 2011 22:50:38 -0500
Content-Disposition: inline
In-Reply-To: <20110208144522.ecea74db.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

On Tue, Feb 08, 2011 at 02:45:22PM +1100, Stephen Rothwell wrote:
> Hi Matthew,
> 
> After merging the drivers-x86 tree, today's linux-next build (x86_64_allmodconfig)
> failed like this:
> 
> drivers/platform/x86/eeepc-wmi.c:118: error: 'KEY_CAMERA_ZOOMIN' undeclared here (not in a function)
> drivers/platform/x86/eeepc-wmi.c:124: error: 'KEY_CAMERA_ZOOMOUT' undeclared here (not in a function)
> drivers/platform/x86/eeepc-wmi.c:125: error: 'KEY_CAMERA_UP' undeclared here (not in a function)
> drivers/platform/x86/eeepc-wmi.c:126: error: 'KEY_CAMERA_DOWN' undeclared here (not in a function)
> drivers/platform/x86/eeepc-wmi.c:127: error: 'KEY_CAMERA_LEFT' undeclared here (not in a function)
> drivers/platform/x86/eeepc-wmi.c:128: error: 'KEY_CAMERA_RIGHT' undeclared here (not in a function)
> 
> Caused by commit 8e077c067a95956859341cd0caddabd99371c7b7 ("eeepc-wmi:
> add camera keys").  Presumably a missing update to a header file ...

Sorry, it was in my tree but uncommitted after I fixed up a merge 
conflict. Repushed.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
