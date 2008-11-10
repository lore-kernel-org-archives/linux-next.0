From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: warning from build
Date: Mon, 10 Nov 2008 15:15:49 -0500
Message-ID: <1226348149.5014.46.camel@localhost.localdomain>
References: <20081110152546.0d13a794.sfr@canb.auug.org.au>
	 <797B9E9F-5C89-4887-BD3A-920D41077A3F@qlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from accolon.hansenpartnership.com ([76.243.235.52]:44307 "EHLO
	accolon.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750787AbYKJUPx (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Nov 2008 15:15:53 -0500
In-Reply-To: <797B9E9F-5C89-4887-BD3A-920D41077A3F@qlogic.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Anirban Chakraborty <anirban.chakraborty@qlogic.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Mon, 2008-11-10 at 10:52 -0800, Anirban Chakraborty wrote:
> On Nov 9, 2008, at 8:25 PM, Stephen Rothwell wrote:
> 
> > Hi James,
> >
> > The current linux-next build (x86_64 allmodconfig) produces this  
> > warning:
> >
> > drivers/scsi/qla2xxx/qla_os.c: In function 'qla2x00_probe_one':
> > drivers/scsi/qla2xxx/qla_os.c:1582: warning: 'mem_only' is used  
> > uninitialized in this function
> >
> > Caused by commit 00aeec5c93a80145cfa939bb9c9e244b207cb48c ("[SCSI]
> > qla2xxx: Code changes for qla data structure refactoring") which  
> > removed
> > the initialisation of mem_only.
> 
> I am really sorry about that. James, should I resubmit the patch or  
> send a patch against
> 00aeec5c93a80145cfa939bb9c9e244b207cb48c commit?

Either is fine ... If you send a separate patch, I'll fold it into the
relevant commit anyway.

James
