From: James Morris <jmorris@namei.org>
Subject: Re: [PATCH] LSM: SafeSetID: 'depend' on CONFIG_SECURITY
Date: Wed, 30 Jan 2019 06:52:01 +1100 (AEDT)
Message-ID: <alpine.LRH.2.21.1901300651530.30410@namei.org>
References: <CAJ-EccMgDvx81g-XgWymdYn_G5Ou8mgbef3GUbx-C_Ai5qF-pQ@mail.gmail.com> <20190129185424.251139-1-mortonm@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129185424.251139-1-mortonm@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Micah Morton <mortonm@chromium.org>
Cc: rdunlap@infradead.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, 29 Jan 2019, mortonm@chromium.org wrote:

> From: Micah Morton <mortonm@chromium.org>
> 
> This patch changes the Kconfig file for the SafeSetID LSM to depend on
> CONFIG_SECURITY as well as select CONFIG_SECURITYFS, since the policies
> for the LSM are configured through writing to securityfs.
> 
> Signed-off-by: Micah Morton <mortonm@chromium.org>

Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git next-general

-- 
James Morris
<jmorris@namei.org>
