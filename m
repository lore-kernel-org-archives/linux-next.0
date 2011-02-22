From: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>
Subject: linux-next packages for openSUSE
Date: Tue, 22 Feb 2011 18:36:42 +0100
Message-ID: <4D63F42A.8010803@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <opensuse-kernel+bounces-2417-glsk-opensuse-kernel=m.gmane.org-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Post: <mailto:opensuse-kernel-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:opensuse-kernel+help-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Subscribe: <mailto:opensuse-kernel+subscribe-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <mailto:opensuse-kernel+unsubscribe-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Owner: <mailto:opensuse-kernel+owner-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Archive: <http://lists.opensuse.org/opensuse-kernel/>
To: opensuse-kernel <opensuse-kernel-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

Hi,

If you are using opensuse and want to contribute to kernel development
by testing the linux-next tree, reporting bugs and verifying fixes, you
now have a convenient way:

# zypper addrepo --refresh \
 http://download.opensuse.org/repositories/Kernel:/linux-next/standard \
 linux-next
# zypper install --from linux-next kernel-vanilla

and then just do 'zypper install kernel-vanilla' (*) every day. The
packages are updated daily by a script and fixed by me as necessary, so
they might be lagging behind at times. The config is previous config +
allmodconfig for new options, so some unwanted debug options can creep
in occasionally. The build logs are here:

https://build.opensuse.org/project/monitor?project=Kernel%3Alinux-next

the configs are here:

http://gitorious.org/opensuse/kernel-source/trees/linux-next/config

Please report installation and config issues to
opensuse-kernel-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org, everything else should go to the upstream
mailing lists as usual.

Happy testing.

Oh, and there are also builds of latest Linus' tree and latest stable:
http://download.opensuse.org/repositories/Kernel:/vanilla/standard/
http://download.opensuse.org/repositories/Kernel:/stable/openSUSE_Factory/

Michal

(*) The name kernel-vanilla might be a bit confusing; in the suse build
scripts it means "upstream kernel without suse patches", not necessarily
Linus' kernel.
