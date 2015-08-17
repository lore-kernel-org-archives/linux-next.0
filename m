From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the security tree
Date: Mon, 17 Aug 2015 15:29:53 +1000
Message-ID: <20150817152953.355a9d4f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, David Woodhouse <David.Woodhouse@intel.com>
List-Id: linux-next.vger.kernel.org

Hi James,

After merging the security tree, today's linux-next build (x86_64
allmodconfig) failed like this:

scripts/extract-cert.c:23:25: fatal error: openssl/bio.h: No such file or directory
 #include <openssl/bio.h>
                         ^
compilation terminated.
scripts/sign-file.c:20:25: fatal error: openssl/bio.h: No such file or directory
 #include <openssl/bio.h>
                         ^

Caused by commits:

  1329e8cc69b9 ("modsign: Extract signing cert from CONFIG_MODULE_SIG_KEY if needed")
  bc1c373dd2a5 ("MODSIGN: Provide a utility to append a PKCS#7 signature to a module")

After a bit of digging, I installed libssl-dev on my Debian build
machines.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
