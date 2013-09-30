From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: Tree for Sep 30
Date: Mon, 30 Sep 2013 12:20:34 +0200
Message-ID: <20130930102033.GA9251@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
List-Id: linux-next.vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

As I'm sure is the case for many of us, I've become very dependent upon
the linux-next tree. So everytime Stephen goes on vacation I break out
in a cold sweat.

Here's my attempt at providing temporary service until Stephen is back.
The result is likely a lot worse than what you're used to. Going through
this made me appreciate what Stephen does even more.

I've uploaded today's tree to a git repository here:

	git://gitorious.org/thierryreding/linux-next.git

There's a master branch with today's tree and a next-20130930 tag as
usual. One notable difference to Stephen's linux-next trees is the
omission of the mmotm patches because I haven't had the time to come up
with the proper scripting for that.

I took some notes about conflicts, but I lack any contact information
for the trees so unless I can scrape some useful information from the
MAINTAINERS file I will just have to send them out to LKML and hope that
the right people look at them.

Test builds of the i386 and x86_64 default configurations don't show any
breakage so far. Provided there's time I may run a test build for ARM
default configurations, but I don't have the resources to do much more
than that. It'd be great if others could help out with the testing. Note
that I haven't run any build tests in between merges, only on the final
tree.

To keep expectations reasonably low, I will not be able to do this every
day, but I'll try to do the linux-next tree as often as I can. If anyone
is interested in helping out, I've included various scripts that I used
in the Next directory:

	- setup: creates remotes for all trees listed in Next/Trees
	- fetch: fetches from all the trees listed in Next/Trees
	- merge: merges all trees in Next/Trees

The fetch and merge scripts assume that the setup script has already
been run. If a merge conflict happens, the merge script will drop you to
a subshell. Once any issues are resolved and the result committed, you
can exit the subshell and the merge will continue where it left off.

In case anyone is interested in doing one of the trees, please let me
know so there's no duplication of work. Mark Brown volunteered to share
the load, but I'm sure we could use more volunteers to make it easier on
all of us.

Hosting of the repository may be a problem. I've requested an account on
kernel.org on Friday, which is obviously somewhat on short notice, and
not everyone might have an account on gitorious. I guess we'll just have
to work with what we have and see how it goes. Unfortunately this
implies that the URL of the tree may change between daily trees.

Thierry

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSSVBxAAoJEN0jrNd/PrOhGNMP/137BvWjso7UgRT9fCm7TgWf
I2z70kGVJ1SVcjTnaEGc+K//UsozpPcArmSTtNTsQonw2G0hn6/vfEvCaZDs4KUl
AyInjxnpjCkpkC2adS1ry3lG7GarSPzGN7ggVarwhkTWybULNVqPz2RpwEKWVb8O
uP1o2DZv9aoX1bNaRkJBIOYc6q1Z/7Q23baITJS38Gjp0armPBTWDjJv4zqiPE+h
8Kb7tsEUDUik2iSb6JHm++V+9ct/0IEF1+iWawONz0XLbG+LgyOdQr+jI3BXdM4k
A84hTQenu3ToFIHPFolBlvmTtww5CUqNy5leVGKIbzVWhGjmkEYjhn+YMPEEqso/
7lmpUQ7xJS0Ck4lvufhi+SaVeHvieUjlj0eO3ZUGur1r2lx7GqDyL3vsihUzRVAC
wXMTcbgKnT3UrRWZ23p7CDNOvloRe57d87Idk9bfZGJCPW558WWw4AVjE5muiMBp
jNv91GnYNHfEYPRCUhHG54beQtVoVMcAPnBa/vp05M2PlBZH/SruzEG0m3mrBjCN
XtlyEpf9AJe6rVT+pzZ441I7X5AMlh1VDA0rGiCEMIs671mEqGckzz8Y/RixTdl1
gXMF+blqUKD6W1RJZ6bvY8jhiMdAVACa7HZ2QaKydWkDmQpRGrKfZsXeniK91R6p
WkQF7sulk1q7JCQHbeOB
=XxQZ
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
