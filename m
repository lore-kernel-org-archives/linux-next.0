From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH -next] ia64, metag: Do not export min_low_pfn in
 arch-specific code
Date: Sun, 28 Apr 2013 11:24:35 +0100
Message-ID: <CAAG0J982gbca3XHHSpTHgqPgeGyJRtG8Lm1cWsT0HsThqdFeMw@mail.gmail.com>
References: <1367086831-10740-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:43282 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755064Ab3D1KYh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 28 Apr 2013 06:24:37 -0400
Received: by mail-bk0-f46.google.com with SMTP id e19so1827541bku.5
        for <linux-next@vger.kernel.org>; Sun, 28 Apr 2013 03:24:36 -0700 (PDT)
In-Reply-To: <1367086831-10740-1-git-send-email-geert@linux-m68k.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sanjay Lal <sanjayl@kymasys.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org, linux-mips@linux-mips.org, linux-ia64@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

On 27 April 2013 19:20, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> As of commit 787dcbe6984b3638e94f60d807dcb51bb8a07211 ("MIPS: Export
> symbols used by KVM/MIPS module"), min_low_pfn is already exported by
> the generic mm/bootmem.c, causing:
>
> WARNING: vmlinux: 'min_low_pfn' exported twice. Previous export was in vmlinux
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

This has been pointed out several times and needs fixing in the mips
tree where the warning was introduced.

Acked-by: James Hogan <james.hogan@imgtec.com>

Cheers
James
