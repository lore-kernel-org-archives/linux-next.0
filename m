From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jan 16 (PCI config warning?)
Date: Wed, 16 Jan 2019 09:00:37 -0800
Message-ID: <bc18898a-8619-fc46-7c42-3d51969ee7f7@infradead.org>
References: <20190116173838.042db659@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116173838.042db659@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sinan Kaya <okaya@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, X86 ML <x86@kernel.org>
List-Id: linux-next.vger.kernel.org

On 1/15/19 10:38 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190115:
> 

on x86_64:

when CONFIG_PCI is not enabled (via randconfig):

WARNING: unmet direct dependencies detected for PCI_LOCKLESS_CONFIG
  Depends on [n]: PCI [=n]
  Selected by [y]:
  - X86 [=y]


-- 
~Randy
