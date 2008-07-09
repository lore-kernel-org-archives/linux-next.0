From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: next-0708: build failure at drivers/pci/pci-acpi.c
Date: Wed, 9 Jul 2008 16:21:37 -0700
Message-ID: <200807091621.37697.jbarnes@virtuousgeek.org>
References: <a4423d670807080518g31402f60j2f624a2ac2db03aa@mail.gmail.com> <200807081040.38777.jbarnes@virtuousgeek.org> <200807082229.33016.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-129.bluehost.com ([67.222.38.29]:59433 "HELO
	outbound-mail-129.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1753618AbYGIXWP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Jul 2008 19:22:15 -0400
In-Reply-To: <200807082229.33016.rjw@sisk.pl>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, ak@linux.intel.com, lenb@kernel.org, linux-acpi@vger.kernel.org, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, pm list <linux-pm@lists.linux-foundation.org>, David Howells <dhowells@redhat.com>

On Tuesday, July 8, 2008 1:29:31 pm Rafael J. Wysocki wrote:
> On Tuesday, 8 of July 2008, Jesse Barnes wrote:
> > David sent me one just like this at 7am this morning, just applied and
> > pushed (along with Alexander's tested-by).
>
> OK, thanks.
>
> Would you like me to send the Stephen's fix for compilation on ppc64
> (CONFIG_PM unset)?

Sure, unless it's already in the ppc tree...

Thanks,
Jesse
