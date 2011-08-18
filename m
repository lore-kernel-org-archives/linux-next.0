From: James Morris <jmorris@namei.org>
Subject: Re: [PATCH] evm: add Kconfig TCG_TPM dependency
Date: Thu, 18 Aug 2011 12:58:55 +1000 (EST)
Message-ID: <alpine.LRH.2.00.1108181258440.23874@tundra.namei.org>
References: <1313621496-8308-1-git-send-email-zohar@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <1313621496-8308-1-git-send-email-zohar@linux.vnet.ibm.com>
Sender: linux-security-module-owner@vger.kernel.org
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@xenotime.net>, David Safford <safford@watson.ibm.com>, Mimi Zohar <zohar@us.ibm.com>
List-Id: linux-next.vger.kernel.org

On Wed, 17 Aug 2011, Mimi Zohar wrote:

> Although the EVM encrypted-key should be encrypted/decrypted using a
> trusted-key, a user-defined key could be used instead. When using a user-
> defined key, a TCG_TPM dependency should not be required.  Unfortunately,
> the encrypted-key code needs to be refactored a bit in order to remove
> this dependency.
> 
> This patch adds the TCG_TPM dependency.

Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next


-- 
James Morris
<jmorris@namei.org>
