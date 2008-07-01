From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 2/2] acpi: Disable IRQ 0 through I/O APIC for some HP systems
Date: Tue, 1 Jul 2008 01:17:27 +0100
Message-ID: <20080701001727.GA4174@srcf.ucam.org>
References: <Pine.LNX.4.55.0807010055070.30785@cliff.in.clinika.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:54157 "EHLO
	vavatch.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754544AbYGAARo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Jun 2008 20:17:44 -0400
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.55.0807010055070.30785@cliff.in.clinika.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Ingo Molnar <mingo@elte.hu>, "Rafael J. Wysocki" <rjw@sisk.pl>, Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-next@vger.kernel.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org

Assuming it works for Rafael (still haven't had time to pull my nx6125 
out of storage):

Signed-off-by: mjg@redhat.com

-- 
Matthew Garrett | mjg59@srcf.ucam.org
