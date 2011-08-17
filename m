From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Aug 17 (EVM)
Date: Wed, 17 Aug 2011 09:40:39 -0700
Message-ID: <20110817094039.0bba7092.rdunlap@xenotime.net>
References: <20110817151628.93911903cac8f207e9f01457@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110817151628.93911903cac8f207e9f01457@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mimi Zohar <zohar@us.ibm.com>, Kylene Hall <kjhall@us.ibm.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, James Morris <jmorris@namei.org>, linux-security-module@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 17 Aug 2011 15:16:28 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> The powerpc allyesconfig build still fails today.

warning: (EVM) selects TRUSTED_KEYS which has unmet direct dependencies (KEYS && TCG_TPM)

EVM should depend on TCG_TPM [or select it :( ].


Can we get an EVM entry added to MAINTAINERS, please?

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
