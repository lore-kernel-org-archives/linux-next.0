From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH -next] eeepc: needs to depend on INPUT
Date: Thu, 19 Feb 2009 19:12:15 +0100
Message-ID: <71cd59b00902191012k764bab32n85f54fc049e35035@mail.gmail.com>
References: <20090220002832.cad00fcd.sfr@canb.auug.org.au>
	 <499D93F0.2090803@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f161.google.com ([209.85.218.161]:62029 "EHLO
	mail-bw0-f161.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756410AbZBSSMS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Feb 2009 13:12:18 -0500
In-Reply-To: <499D93F0.2090803@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Thu, Feb 19, 2009 at 6:16 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
>
> EEEPC_LAPTOP needs to depend on INPUT to fix build errors that
> can happen when EEEPC_LAPTOP=y and INPUT=m:

There is already a patch sent to linux-acpi and Len Brown.

http://patchwork.kernel.org/patch/7354/

-- 
Corentin Chary
http://xf.iksaif.net
