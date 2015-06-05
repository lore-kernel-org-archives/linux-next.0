From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: build failure after merge of the drivers-x86 tree
Date: Fri, 05 Jun 2015 20:13:01 +1000
Message-ID: <1433499181.8590.1.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, rkrcmar@redhat.com
List-Id: linux-next.vger.kernel.org

Hi Darren,

After merging the drivers-x86 tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: "acpi_bus_get_status_handle" [drivers/platform/x86/pvpanic.ko] undefined!

Caused by commit b8f8cf6b02b6 ("pvpanic: handle missing _STA correctly").

I have applied the fixup patch from Radim for today
(http://marc.info/?l=linux-next&m=143344030214935&w=2).

cheers
