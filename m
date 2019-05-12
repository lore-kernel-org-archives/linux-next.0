From: Carlo Pisani <carlojpisani@gmail.com>
Subject: Re: C3600, sata controller
Date: Sun, 12 May 2019 23:15:40 +0200
Message-ID: <CA+QBN9AZHQHTGFVc21UfROHObKxAZz+bwCPeMf-Tpjn2UHmDNg@mail.gmail.com>
References: <20190502074519.61272b42@canb.auug.org.au> <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
 <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com> <f52cf203-c48a-fd04-5827-19903c3a192f@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f52cf203-c48a-fd04-5827-19903c3a192f@bell.net>
Sender: linux-kernel-owner@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Cc: Parisc List <linux-parisc@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

> The c3600 doesn't have any PCI-X slots (only PCI) as far as I can tell from user manuals.

PCI-32/33 device I/O bus
PCI-64/33 high-performance device I/O bus <----------------- this is
PCI-X, 64bit 5V
PCI-64/66 high-performance graphics I/O bus <----------------- this is
PCI-X, 64bit 3.3V

https://www.openpa.net/systems/hp-visualize_b1000_c3000_c3600.html
