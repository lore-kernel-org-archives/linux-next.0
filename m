From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jul 24 (apparmor)
Date: Sun, 24 Jul 2016 16:26:38 -0700
Message-ID: <7a66a4c7-60cb-166d-2518-b7ba8de0033b@infradead.org>
References: <20160724182040.1e49e90f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20160724182040.1e49e90f@canb.auug.org.au>
Sender: owner-linux-security-module@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, John Johansen <john.johansen@canonical.com>, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 07/24/16 01:20, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160722:
> 

on x86_64:

CONFIG_SECURITY_APPARMOR=y
CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
# CONFIG_SECURITY_APPARMOR_HASH is not set

../security/apparmor/lsm.c:675:25: error: 'CONFIG_SECURITY_APPARMOR_HASH_DEFAULT' undeclared here (not in a function)
 bool aa_g_hash_policy = CONFIG_SECURITY_APPARMOR_HASH_DEFAULT;
                         ^


-- 
~Randy
