# Configuration file for the Sphinx documentation builder.
# def setup(app):
#     app.add_css_file('custom.css')
# -- Project information

project = 'Comsign'
copyright = 'Comsign © 2020–2025.'

release = '1.0'
version = '1.5.1'
html_title = 'Comsign Documentation'
html_permalinks = False
html_add_permalinks = ''

# -- General configuration

extensions = [
    'sphinx.ext.duration',
    'sphinx.ext.doctest',
    'sphinx.ext.autodoc',
    'sphinx.ext.autosummary',
    'sphinx.ext.intersphinx',
]

intersphinx_mapping = {
    'python': ('https://docs.python.org/3/', None),
    'sphinx': ('https://www.sphinx-doc.org/en/master/', None),
}
intersphinx_disabled_domains = ['std']

templates_path = ['_templates']

# -- Options for HTML output
html_theme = 'sphinx_rtd_theme'

html_static_path = ['_static']
html_css_files = ['custom.css']

html_logo = 'img/logo.svg'
html_theme_options = {
    'logo_only': True,
    'display_version': False,
}
# -- Options for EPUB output
epub_show_urls = 'footnote'
