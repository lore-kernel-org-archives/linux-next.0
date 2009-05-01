From: Steve French <smfrench@gmail.com>
Subject: Re: linux-next: cifs tree build warning
Date: Thu, 30 Apr 2009 23:05:20 -0500
Message-ID: <524f69650904302105g3e236752g8a2f2fa76552be9f@mail.gmail.com>
References: <20090501134700.148955dd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.29]:60413 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750734AbZEAEFU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 May 2009 00:05:20 -0400
Received: by yw-out-2324.google.com with SMTP id 5so1283212ywb.1
        for <linux-next@vger.kernel.org>; Thu, 30 Apr 2009 21:05:20 -0700 (PDT)
In-Reply-To: <20090501134700.148955dd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-cifs-client@lists.samba.org, linux-next@vger.kernel.org

On Thu, Apr 30, 2009 at 10:47 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Steve,
>
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
>
> fs/cifs/connect.c:2609: warning: 'CIFSNTLMSSPNegotiateSessSetup' defined but not used
> fs/cifs/connect.c:2943: warning: 'CIFSNTLMSSPAuthSessSetup' defined but not used
>
> Introduced by commit 20418acd6874792359b42c12d159f42f17593f34 ("[CIFS]
> Remove older session setup implementation") which removed the last users of

These are being rewritten and moved (probably to a new file ntlmssp.c) tomorrow.


-- 
Thanks,

Steve
